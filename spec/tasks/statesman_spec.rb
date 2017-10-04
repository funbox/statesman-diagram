require 'spec_helper'
require 'rake'

load 'tasks/statesman.rake'

task :environment do
  module Spaghetti
    class Machine
      include Statesman::Machine

      state :a
      state :b

      transition from: :a, to: :b
    end
  end
end

describe 'statesman:diagram' do
  it 'produces a png image with a diagram of the given state machine class' do
    Rake::Task['statesman:diagram'].invoke('Spaghetti::Machine')
    expect(File.exists?('Spaghetti_Machine.png')).to be true
    expect(File.size('Spaghetti_Machine.png')).to be > 100
    FileUtils.rm('Spaghetti_Machine.png')
  end
end
