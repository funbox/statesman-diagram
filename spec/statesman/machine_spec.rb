require 'statesman-diagram'

describe Statesman::Machine do
  describe ".to_dot" do
    it "returns machine description in the DOT language" do
      module United
        class States
          include Statesman::Machine

          state :a
          state :b
          state :c

          transition from: :a, to: :b
          transition from: :b, to: [:a, :c]
        end
      end

      expect(United::States.to_dot).to eq <<-DOT
digraph United_States {
  a -> b;
  b -> a;
  b -> c;
}
      DOT
    end
  end
end
