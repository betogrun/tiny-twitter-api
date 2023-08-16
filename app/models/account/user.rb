# frozen_string_literal: true

module Account
  User = Data.define(:id, :username, :created_at) do
    def joined_at = created_at.strftime('%B %d, %Y')
  end
end