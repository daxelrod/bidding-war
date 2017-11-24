require 'rubocop/rake_task'

RuboCop::RakeTask.new

task lint: :rubocop

task default: :rubocop
