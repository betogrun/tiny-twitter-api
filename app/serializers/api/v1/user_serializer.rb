module API
  module V1
    class UserSerializer
      include ActiveModel::Serializers::JSON

      delegate :id, :username, :joined_at, :posts_count, to: :@user

      def initialize(user)
        @user = user
      end

      def attributes
        {
          id:,
          username:,
          joined_at:,
          posts_count:
        }
      end
    end
  end
end