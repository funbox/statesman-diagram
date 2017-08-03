namespace :statesman do
  desc "Render a PNG image of the state diagram of the given state machine class"
  task :diagram, [:class] => :environment do |t, args|
    machine_class = self.class.const_get(args[:class])
    puts "Will draw the state diagram of #{machine_class}"
    dot = machine_class.to_dot
    puts "Here it is in the textual form:"
    puts dot
    filename = "#{machine_class.name.gsub('::','_')}.png"
    cmd = %W(dot -Tpng -o#{filename})
    puts "Running '#{cmd.join(' ')}' with this ^ as stdin..."
    require 'open3'
    output, status = Open3.capture2e(*cmd, stdin_data: dot)
    if status.success?
      puts "Success. You can open #{filename} and see the diagram."
    else
      puts 'The command failed:'
      puts output
    end
  end
end
