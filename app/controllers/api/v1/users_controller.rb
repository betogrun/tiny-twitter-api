module API
  module V1
    class UsersController < API::V1::Controller
      def show
        user = Data
          .define(:id, :username, :joined_at, :posts_count)
          .new(params[:id], 'username', 'March 25, 2021', 0)
        render_json(user, serializer: ::API::V1::UserSerializer, status: :ok)
      end
    end
  end
end