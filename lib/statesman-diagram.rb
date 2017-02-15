require "statesman/machine"

module Statesman
  module Machine
    module ClassMethods
      def to_dot
        <<-DOT
digraph #{name.gsub('::', '_')} {
#{successors.map{|from, tos| tos.map{|to| "  #{from} -> #{to};" } }.flatten.join("\n")}
}
        DOT
      end
    end
  end
end
