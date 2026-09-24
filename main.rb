#!/usr/bin/env ruby
require_relative "def.rb"
terminal = TermCpp.new
raylib = RayCpp.new


if ARGV[0] == "--cpp" && ARGV[1] == "-r"
    puts "Preparing C++ raylib project..."
    raylib.make_ray_CPP()
    puts "Success!"
elsif ARGV[0] == "--cpp" && ARGV[1] == "-t"
    puts "Preparing C++ terminal project..."
    terminal.make_terminal_CPP()
    puts "Success!"
elsif ARGV[0] == "--cs" 
    puts "Preparing C# project..."
    makeCS()
    puts "Success!"
elsif ARGV[0] == "--rb"
    puts "Preparing Ruby project..."
    makeRB()
    puts "Success!"
elsif ARGV[0] == "--help"
    Help()
elsif ARGV[0] == "--mfile" && ARGV[1] == "-r"
    puts "Preparing raylib makefile..."
    puts "Success!"
elsif ARGV[0] == "-mfile" && ARGV[1] == "-t"
    puts "Preparing terminal makefile..."
    puts "Success!"
else
    puts "ERROR: Invalid Argument"
    puts "HELP: make-proj --help to see a list of valid commands"
end 

    

