require 'spec_helper'

describe Statesman::Machine do
  class User
    class StateMachine
      include Statesman::Machine

      state :a
      state :b
      state :c

      transition from: :a, to: :b
      transition from: :b, to: [:a, :c]
    end
  end

  let(:described_class) { User::StateMachine }

  describe '.diagram' do
    subject { described_class.diagram }

    it 'returns diagram' do
      expect(Statesman::Diagram).to receive(:new).with(
        name: 'User_StateMachine',
        graph: {
          'a' => ['b'],
          'b' => ['a', 'c']
        }
      ).and_call_original

      is_expected.to be_a(Statesman::Diagram)
    end
  end

  describe '.to_dot' do
    subject { described_class.to_dot }

    it 'returns state machine description in the DOT language' do
      is_expected.to eq("digraph User_StateMachine {\n  a -> b;\n  b -> a;\n  b -> c;\n}")
    end
  end
end
