# -*- mode: ruby; -*-
# Rakefile for cdenv, currently only for running tests

task :default => [:test]

task :test do
  Dir.glob("lib/test/*.rb").each {|test_file|
    ruby test_file
  }
end

task :html do
  require 'rdiscount'
  infile = "README.md"
  outfile = "README.html"
  print "Generating #{outfile} from #{infile}...  "
  File.open(outfile, "w").puts RDiscount.new(File.open(infile).read).to_html
  puts "Done."
end
