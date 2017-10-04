namespace :statesman do
  desc 'Render a PNG image of the state diagram of the given state machine class'
  task :diagram, [:class, :file_name] => :environment do |t, args|
    machine_class = self.class.const_get(args[:class])

    puts "Will draw the state diagram of #{machine_class}"
    puts "Here it is in the textual form:\n#{machine_class.to_dot}"

    machine_class.to_png(args[:file_name])
  end
end
