require "rubygems"
require "bundler/setup"
require "jekyll"
require "yaml"
require "net/ftp"

desc "Generate Site"
task :generate do
  Jekyll::Site.new(Jekyll.configuration()).process
end

desc "Generate Site and Publish to Server"
task :publish => [:generate] do
  
  
  
end
  