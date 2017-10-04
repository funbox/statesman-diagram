require 'open3'

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

    def to_png(file_name = nil)
      file_name ||= @name
      file_name += '.png'

      build_png(file_name)
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

    def build_png(file_name)
      cmd = ['dot', '-Tpng', "-o#{file_name}"]

      puts "Running '#{cmd.join(' ')}' with this ^ as stdin..."

      output, status = Open3.capture2e(*cmd, stdin_data: to_dot)
      if status.success?
        puts "Success. You can open #{file_name} and see the diagram."
      else
        puts 'The command failed:'
        puts output
      end
    end
  end
end
