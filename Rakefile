require 'bundler'
require 'open3'

task :default => :serve

desc "Cleans all 'export' folders out of demos folders"
task :clean_demos do
  print "Cleaning Demos..."
  FileUtils.rm_r(Dir.glob('**/export'))
  print "Done\n"
end

desc "Builds all of the demos"
task :build_demos => [:clean_demos] do
  puts "Building Demos..."
  FileUtils.rm_r(Dir.glob('_site/demos/**'))
  FileUtils.rm_r(Dir.glob('_site/title-logo'))
  results, error, status = Open3.capture3("haxelib", "run", "flixel-tools", "buildprojects", "html5", "-dir", ".", "--", "-final")
  puts results
  if !status.success?
    puts "ERROR! - #{error}"
    exit 1
  end
  puts "Done";
end

desc "Build the site with Jekyll"
task :build_site do
  ENV["JEKYLL_ENV"] = "production"
  jekyll('build')
end

desc "Build the entire site"
task :deploy => [:build_demos, :build_site]

desc "Serve the site to localhost:4000"
task :serve => [:build_demos, :serve_site]

desc "Just serves the site, does not rebuild demos"
task :serve_site do
  jekyll('serve --incremental --force_polling')
end

def jekyll(opts = '')
  sh 'jekyll ' + opts
end
