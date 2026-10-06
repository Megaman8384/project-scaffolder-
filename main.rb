#!/usr/bin/env ruby
require_relative "def.rb"

# C++ GENERATION
if ARGV[0] == "--cpp" && ARGV[1] == "-r" && ARGV[2] == "--linux"
  puts "Preparing linux raylib C++ project..."
  make_ray_CPP_linux()
  puts "Success!"
elsif ARGV[0] == "--cpp" && ARGV[1] == "-r" && ARGV[2] == "--mac"
  puts "Preparing macOS C++ raylib project..."
  make_ray_CPP()
  puts "Success!"
elsif ARGV[0] == "--cpp" && ARGV[1] == "-gl" && ARGV[2] == "--linux"
  puts "Preparing Linux OpenGL project..."
  make_opengl_linux()
  puts "Success!"
elsif ARGV[0] == "--cpp" && ARGV[1] == "-gl" && ARGV[2] == "--mac"
  puts "Preparing MacOS OpenGL project..."
  make_opengl_mac()
  puts "Success!"
elsif ARGV[0] == "--cpp" && ARGV[1] == "-t"
  puts "Preparing C++ terminal project..."
  make_terminal_CPP()
  puts "Success!"



# C# GENERATION
elsif ARGV[0] == "--cs"
  puts "Preparing C# project..."
  makeCS()
  puts "Success!"


# RUBY GENERATION
elsif ARGV[0] == "--rb"
  puts "Preparing Ruby project..."
  makeRB()
  puts "Success!"


# MAKEFILE GENERATION
elsif ARGV[0] == "--mfile" && ARGV[1] == "-r" && ARGV[2] == "--mac"
  puts "Preparing macOS raylib makefile..."
  gen_ray_makefile()
  puts "Success!"
elsif ARGV[0] == "--mfile" && ARGV[1] == "-r" && ARGV[2] == "--linux"
  puts "Preparing linux raylib makefile..."
  gen_ray_linux_makefile()
  puts "Success!"
elsif ARGV[0] == "--mfile" && ARGV[1] == "-gl" && ARGV[2] == "--linux"
  puts "Preparing OpenGL makefile for linux..."
  gen_opengl_makefile_linux()
  puts "Success!"
elsif ARGV[0] == "--mfile" && ARGV[1] == "-gl" && ARGV[2] == "--mac"
  puts "Preparing OpenGL makefile for macOS..."
  gen_opengl_makefile_mac()
  puts "Success!"
elsif ARGV[0] == "--mfile" && ARGV[1] == "-t"
  puts "Preparing terminal makefile..."
  gen_term_makefile()
  puts "Success!"


# HELP/UPDATE/ERROR
elsif ARGV[0] == "--help"
  Help()
elsif ARGV[0] == "--update"
  puts "updating..."
  update_make_proj()
  puts "Success!"

else
  puts "ERROR: Invalid Argument"
  puts "HELP: make-proj --help to see a list of valid commands"
end
