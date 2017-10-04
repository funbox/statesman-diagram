require 'spec_helper'

describe Statesman::Diagram do
  describe '.version' do
    subject { described_class::VERSION }

    it { is_expected.not_to be_nil }
  end

  describe '#to_dot' do
    subject { diagram.to_dot }

    let(:diagram) { described_class.new(name: 'User_StateMachine', graph: {a: [:b], b: [:a, :c]}) }

    it 'returns diagram description in the DOT language' do
      is_expected.to eq("digraph User_StateMachine {\n  a -> b;\n  b -> a;\n  b -> c;\n}")
    end
  end
end
