module Statesman
  class Diagram
    # @param [String] name  - name of the diagram.
    # @param [Hash]   graph - list of vertices and edges.
    def initialize(name:, graph:)
      @name  = name
      @graph = graph
    end

    # @return [String] diagram in DOT format.
    def to_dot
      format("digraph %{name} {\n  %{body}\n}", name: @name, body: dot_body.join("\n  "))
    end

    private

    # @return [String]
    def dot_body
      @graph.map do |vertex, edges|
        edges.map do |to|
          "#{vertex} -> #{to};"
        end
      end.flatten
    end
  end
end
