# frozen_string_literal: true

begin
  require "cucumber/rake/task"

  namespace :cucumber do
    Cucumber::Rake::Task.new(:ok) do |t|
      t.cucumber_opts = ["--publish-quiet", "--format", "pretty"].join(" ")
    end

    Cucumber::Rake::Task.new(:wip) do |t|
      t.cucumber_opts = ["--tags", "@wip", "--wip"].join(" ")
    end
  end

  task default: "cucumber:ok"
rescue LoadError => e
  warn "Cucumber is not available: #{e.message}"
end
