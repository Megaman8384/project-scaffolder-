def makeRB()
    main_contents = File.read("#{__dir__}/rb/main.txt")
                            
    def_contents = File.read("#{__dir__}/rb/def.txt")

    Dir.mkdir('new_ruby_project')
    File.write("new_ruby_project/main.rb", main_contents)
    File.write("new_ruby_project/def.rb", def_contents)
end



def makeCS()
    cs_contents = File.read("#{__dir__}/cs/main.txt")

    Dir.mkdir('new_C#_project')
    File.write("new_C#_project/main.cs", cs_contents)
end



def make_terminal_CPP()
    cpp_main_contents = File.read("#{__dir__}/cpp/terminal/main.txt")
    hpp_contents = File.read("#{__dir__}/cpp/terminal/header.txt")
    make_contents = File.read("#{__dir__}/cpp/terminal/makefile.txt")

    Dir.mkdir('new_CPP_teminal_project')
    File.write("new_CPP_teminal_project/main.cpp", cpp_main_contents)
    File.write("new_CPP_teminal_project/main.hpp", hpp_contents)
    File.write("new_CPP_teminal_project/makefile", make_contents)
end




def make_ray_CPP()
    ray_main_contents = File.read("#{__dir__}/cpp/raylib/main.txt")
    ray_header_contents = File.read("#{__dir__}/cpp/raylib/header.txt")
    ray_make_contents = File.read("#{__dir__}/cpp/raylib/make.txt")

    Dir.mkdir('new_CPP_raylib_project')

    File.write("new_CPP_raylib_project/main.cpp", ray_main_contents)
    File.write("new_CPP_raylib_project/main.hpp", ray_header_contents)
    File.write("new_CPP_raylib_project/makefile", ray_make_contents)
end

def make_ray_CPP_linux()
    ray_main_contents = File.read("#{__dir__}/cpp/raylib/main.txt")
    ray_header_contents = File.read("#{__dir__}/cpp/raylib/header.txt")
    ray_make_contents = File.read("#{__dir__}/cpp/raylib/linux_make.txt")

    Dir.mkdir('new_CPP_raylib_project_linux')

    File.write("new_CPP_raylib_project_linux/main.cpp", ray_main_contents)
    File.write("new_CPP_raylib_project_linux/main.hpp", ray_header_contents)
    File.write("new_CPP_raylib_project_linux/makefile", ray_make_contents)
end     

def gen_ray_makefile()
    ray_make_contents = File.read("#{__dir__}/cpp/raylib/make.txt")
    File.write("makefile", ray_make_contents)
end 

def gen_ray_linux_makefile
    ray_make_contents = File.read("#{__dir__}/cpp/raylib/linux_make.txt")
    File.write("new_CPP_raylib_project/makefile", ray_make_contents)
end

def gen_term_makefile()
    make_contents = File.read("#{__dir__}/cpp/terminal/makefile.txt")
    File.write("makefile", make_contents)
end

def update_make_proj()
  system("cp #{__dir__}/main.rb ~/.local/bin/make-proj")
  system("cp #{__dir__}/def.rb ~/.local/bin/def.rb")
  system("cp -R #{__dir__}/rb #{__dir__}/cs #{__dir__}/cpp ~/.local/bin/")
  system("chmod +x ~/.local/bin/make-proj")
end



def Help
    system("clear")
    puts "------------------------------------------------------"
    puts "                  MAKE-PROJ HELPER                    "
    puts "------------------------------------------------------"
    puts "make-proj --cpp -r --mac: generate a new macOS C++ raylib project"
    puts "make-proj --cpp -r --linux: generate a new C++ raylib project with a linux specific makefile"
    puts ""
    puts "make-proj --cpp -t: generate a new C++ terminal project"
    puts ""
    puts "make-proj --rb: generate a new Ruby project"
    puts "make-proj --cs: generate a new C# project"
    puts ""
    puts "make-proj --mfile -r --mac: generate a macOS specific raylib makefile"
    puts "make-proj --mfile -r --linux: generate a linux specific raylib makefile"
    puts ""
    puts "make-proj --mfile -t: generate a terminal makefile"
    puts ""
    puts "make-proj --update: update your current make-proj config saved in your shell system"
    puts "------------------------------------------------------"
end 