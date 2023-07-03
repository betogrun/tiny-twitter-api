# frozen_string_literal: true

class PlainCase
  module Result
    Success = Data.define(:value) do
       def deconstruct = [:success, value]
       def deconstruct_keys(_) = { status: :success, value: value }
    end

    Failure = Data.define(:value, :type) do
      def deconstruct = [:failure, value, type] 
      def deconstruct_keys(_) = { status: :failure, value: value, type: type }
    end
  end

  def self.call(**) = new(**).call

  def initialize(**) = raise NotImplementedError

  def call(**) = raise NotImplementedError

  def Success(value) = Result::Success.new(value)

  def Failure(value, type: :error) = Result::Failure.new(value, type)
end

