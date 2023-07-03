
require 'rails_helper'

RSpec.describe PlainCase do
  describe '.call' do
    it 'raises NotImplementedError' do
      expect { described_class.call }.to raise_error(NotImplementedError)
    end
  end

  describe '#initialize' do
    it 'raises NotImplementedError' do
      expect { described_class.new }.to raise_error(NotImplementedError)
    end
  end

  describe '#call' do
    it 'raises NotImplementedError' do
      expect { described_class.new.call }.to raise_error(NotImplementedError)
    end
  end

  describe 'Success' do
    let(:test_case) { Class.new(PlainCase) { def initialize(*); end } }
    let(:success) { test_case.new.Success(:result) }

    it 'creates a Success instance' do
      expect(success).to be_instance_of(PlainCase::Result::Success)
    end

    it 'has correct deconstruction' do
      expect(success.deconstruct).to eq([:success, :result])
    end

    it 'has correct deconstruction keys' do
      expect(success.deconstruct_keys(nil)).to eq({ status: :success, result: :result })
    end
  end

  describe 'Failure' do
    let(:test_case) { Class.new(PlainCase) { def initialize(*); end } }
    let(:failure) { test_case.new.Failure(:result) }

    it 'creates a Failure instance' do
      expect(failure).to be_instance_of(PlainCase::Result::Failure)
    end

    it 'has correct deconstruction' do
      expect(failure.deconstruct).to eq([:failure, :result, :error])
    end

    it 'has correct deconstruction keys' do
      expect(failure.deconstruct_keys(nil)).to eq({ status: :failure, result: :result, type: :error })
    end
  end
end
