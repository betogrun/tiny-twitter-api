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



# class MyOperation < PlainCase
#   def initialize(input:)
#     @input = input
#   end

#   def call
#     if @input > 0
#       Success(@input)
#     else
#       Failure("Input must be positive", type: :input_error)
#     end
#   end
# end

# result = MyOperation.call(input: -1)

# # Pattern matching with Array
# case result
# in [:success, value, *]
#   puts "Operation was successful, value is #{value}"
# in [:failure, message, *]
#   puts "Operation failed with message: #{message}"
# end

# # Pattern matching with Hash
# case result
# in {status: :success, result: value}
#   puts "Operation was successful, value is #{value}"
# in {status: :failure, result: message, type: _}
#   puts "Operation failed with message: #{message}"
# end
