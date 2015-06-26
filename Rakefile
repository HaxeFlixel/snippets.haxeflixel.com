require 'html/proofer'

task :default => :serve

desc "Cleans all 'export' folders out of demos folders"
task :clean_demos do
  FileUtils.rm_rf(Dir.glob('**/export'))
end

desc "Builds all of the demos"
task :build_demos => [:clean_demos] do
  FileUtils.rm_rf(Dir.glob('_site/demos/**'))
  FileUtils.rm_rf(Dir.glob('_site/title-logo'))
  if ! system 'haxelib run flixel-tools buildprojects -dir .'
    exit 1
  end
end

desc "Check HTML::Proofer"
task :html_proof do
  HTML::Proofer.new("./_site").run
end

desc "Build the site with Jekyll"
task :build_site do
  jekyll('build')
end

desc "Build the entire site"
task :deploy => [:build_demos, :build_site, :html_proof]

desc "Serve the site to localhost:4000"
task :serve => [:build_demos, :serve_site]

desc "Just serves the site, does not rebuild demos"
task :serve_site do
  jekyll('serve')
end


def jekyll(opts = '')
  sh 'jekyll ' + opts
end
