require 'statesman/machine'

module Statesman
  module Machine
    module ClassMethods
      # @return [Statesman::Diagram] diagram for the state machine
      def diagram
        Diagram.new(name: name.gsub('::', '_'), graph: successors)
      end

      # @return [String] state machine in DOT format.
      def to_dot
        diagram.to_dot
      end

      def to_png(file_name = nil)
        diagram.to_png(file_name)
      end
    end
  end
end
