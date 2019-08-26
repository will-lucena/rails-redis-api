module Api

  module V1
    class PlayersController < ApplicationController
      def index
        players = $redis.get("players");

        if players.nil?
          players = Player.all.to_json
          $redis.set("players", players)
          $redis.expire("players", 5.hour.to_i)
        end
        render json: {status: 'SUCCESS', message:'Players', data:players}, status: :ok
      end
    end
  end

end
