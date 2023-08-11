# frozen_string_literal: true

module Account
  class RetrieveUser < PlainCase
    def initialize(id:, repository: Repository)
      @id = id&.to_i
      @repository = repository
    end

    def call
      return Failure(type: :invalid_param, value: 'Invalid param') unless id&.positive?

      user = repository.find_user(id)
      return Failure(type: :not_found, value: 'User not found') unless user

      Success(user)
    end

    private

    attr_reader :id, :repository
  end
end