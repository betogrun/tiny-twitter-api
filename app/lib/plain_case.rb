# frozen_string_literal: true

class PlainCase
  module Result
    Success = Data.define(:value) do
       def deconstruct = [:success, value]
       def deconstruct_keys(_) = { state: :success, value: value }
    end

    Failure = Data.define(:type, :value) do
      def deconstruct = [:failure, type, value] 
      def deconstruct_keys(_) = { state: :failure, type: type, value: value }
    end
  end

  def self.call(**) = new(**).call

  def initialize(**) = raise NotImplementedError

  def call(**) = raise NotImplementedError

  def Success(value = nil) = Result::Success.new(value)

  def Failure(type: :error, value: nil) = Result::Failure.new(type, value)
end

