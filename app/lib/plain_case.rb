# frozen_string_literal: true

class PlainCase
  module Result
    Success = Data.define(:result) do
       def deconstruct = [:success, result]
       def deconstruct_keys(_) = { status: :success, result: result }
    end

    Failure = Data.define(:result, :type) do
      def deconstruct = [:failure, result, type] 
      def deconstruct_keys(_) = { status: :failure, result: result, type: type }
    end
  end

  def self.call(**) = new(**).call

  def initialize(**) = raise NotImplementedError

  def call(**) = raise NotImplementedError

  def Success(result) = Result::Success.new(result)

  def Failure(result, type = :error) = Result::Failure.new(result, type)
end

