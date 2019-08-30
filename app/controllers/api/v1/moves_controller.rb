module Api
  module V1
    class MovesController < ApplicationController
      $redis = Redis.new(host: "localhost")

      def index
        moves = $redis.zrange("rank", 0, 10)
        render json: {status: 'SUCCESS', message: 'Rank', data: moves}, status: :ok
      end

      def show
        index = params[:id] -1
        score = $redis.zrange("rank", index, index)
        render json: {status: 'SUCCESS', message: 'Score', data: score}, status: :ok
      end

      def create
        puts("porra borracha")
        move = Move.new(move_params)
        result = $redis.zincrby("rank", move.score, move.player_name)
        if result
					render json: {status: 'SUCCESS', message: 'Score updated', data: result},status: :ok
				else
					render json: {status: 'ERROR', message: 'Fail on update the score', data: result.erros},status: :unprocessable_entity
				end
      end
      
      private
      def move_params
				params.permit(:player_name, :score)
      end
      
    end
  end

end
