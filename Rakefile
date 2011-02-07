# -*- mode: ruby; -*-
# Rakefile for cdenv, currently only for running tests

task :default => [:test]

task :test do
  Dir.glob("lib/test/*.rb").each {|test_file|
    ruby test_file
  }
end
