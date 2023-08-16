module API
  module V1
    class UsersController < API::V1::Controller
      def show
        case ::Account::RetrieveUser.call(id: permitted_params[:id])
          in { state: :success, value: user}
            render_json(user, serializer: ::API::V1::UserSerializer, status: :ok)
          in { state: :failure, type: :invalid_param, value: message }
            render(json: { message: message }, status: :bad_request)
          in { state: :failure, type: :not_found, value: message }
            render(json: { message: message }, status: :unprocessable_entity)
        end
      end

      private

      def permitted_params = params.permit(:id)
    end
  end
end