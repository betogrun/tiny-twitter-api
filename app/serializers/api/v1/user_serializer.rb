module API
  module V1
    class UserSerializer
      include ActiveModel::Serializers::JSON

      delegate :id, :username, :joined_at, to: :@user

      def initialize(user)
        @user = user
      end

      def attributes = {id:, username:, joined_at: }
    end
  end
end