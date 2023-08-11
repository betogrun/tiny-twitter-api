# frozen_string_literal: true

module Account
  module Repository
    module_function

    ToUser = ->(record) { ::Account::User.new(record.id, record.username, record.created_at) }

    def find_user(id)
      ::User.find_by(id:)&.then(&ToUser)
    end
  end
end