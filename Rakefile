require "rubygems"
require "bundler/setup"
require "jekyll"
#require "yaml"
#require "net/ftp"
require "html/proofer"

desc "Generate Site"
task :generate do
  Jekyll::Site.new(Jekyll.configuration()).process
end

desc "Generate Site and Publish to Server"
task :publish => [:generate] do
  # to-do
end

desc "Default Task"
task :default => [:generate]
  HTML::Proofer.new("./_site").run
end
  