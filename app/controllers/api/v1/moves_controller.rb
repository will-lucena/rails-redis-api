module Api

  module V1
    class MovesController < ApplicationController
      def index
        moves = $redis.zrange("rank", 0, 10).to_json
        render json: {status: 'SUCCESS', message:'Rank', data:moves}, status: :ok
      end

      def show
        moves = $redis.zrange("rank", 0).to_json
        render json: {status: 'SUCCESS', message:'Rank', data:moves}, status: :ok
      end

      def create
        move = Move.new(move_params)
        result = $redis.zincrby("rank", move.score, move.player_name)
        #$redis.set(move.player_name, move.score)
        #result = $redis.get(move.player_name)
        if result
					render json: {status: 'SUCCESS', message:'Saved article', data:result},status: :ok
				else
					render json: {status: 'ERROR', message:'Articles not saved', data:result.erros},status: :unprocessable_entity
				end
      end
      
      private
      def move_params
				params.permit(:player_name, :score)
      end
      
    end
  end

end
