
# make file generation
def gen_term_makefile()
  make_contents = File.read("#{__dir__}/cpp/terminal/makefile.txt")
  File.write("makefile", make_contents)
end


def gen_ray_makefile()
  ray_make_contents = File.read("#{__dir__}/cpp/raylib/make.txt")
  File.write("makefile", ray_make_contents)
end


def gen_ray_linux_makefile()
  ray_make_contents = File.read("#{__dir__}/cpp/raylib/linux_make.txt")
  File.write("new_CPP_raylib_project/makefile", ray_make_contents)
end


def gen_opengl_makefile_mac()
  make_contents = File.read("#{__dir__}/cpp/opengl/make_mac.txt")
  File.write("makefile", make_contents)
end


def gen_opengl_makefile_linux()
  make_contents = File.read("#{__dir__}/cpp/opengl/make_linux.txt")
  File.write("makefile", make_contents)
end


# project generation
def makeRB()
    main_contents = File.read("#{__dir__}/rb/main.txt")

    def_contents = File.read("#{__dir__}/rb/def.txt")

    Dir.mkdir('new_ruby_project')
    File.write("new_ruby_project/main.rb", main_contents)
    File.write("new_ruby_project/def.rb", def_contents)
end


def makeCS()
    cs_contents = File.read("#{__dir__}/cs/main.txt")
    csproj_contents = File.read("#{__dir__}/cs/csproj.txt")

    Dir.mkdir('new_C#_project')
    File.write("new_C#_project/main.cs", cs_contents)
    File.write("new_C#_project/main.csproj", csproj_contents)
end


def make_terminal_CPP()
  cpp_main_contents = File.read("#{__dir__}/cpp/terminal/main.txt")
  hpp_contents = File.read("#{__dir__}/cpp/terminal/header.txt")
  make_contents = File.read("#{__dir__}/cpp/terminal/makefile.txt")

  Dir.mkdir('new_CPP_terminal_project')
  Dir.mkdir('new_CPP_terminal_project/src')
  Dir.mkdir('new_CPP_terminal_project/include')

  File.write("new_CPP_terminal_project/src/main.cpp", cpp_main_contents)
  File.write("new_CPP_terminal_project/include/main.hpp", hpp_contents)
  File.write("new_CPP_terminal_project/makefile", make_contents)
end


def make_ray_CPP()
  ray_main_contents = File.read("#{__dir__}/cpp/raylib/main.txt")
  ray_header_contents = File.read("#{__dir__}/cpp/raylib/header.txt")
  make_contents = File.read("#{__dir__}/cpp/raylib/make.txt")

  Dir.mkdir('new_CPP_raylib_project')
  Dir.mkdir('new_CPP_raylib_project/src')
  Dir.mkdir('new_CPP_raylib_project/include')


  File.write("new_CPP_raylib_project/src/main.cpp", ray_main_contents)
  File.write("new_CPP_raylib_project/include/main.hpp", ray_header_contents)
  File.write("new_CPP_raylib_project/makefile", make_contents)
end


def make_ray_CPP_linux()
  ray_main_contents = File.read("#{__dir__}/cpp/raylib/main.txt")
  ray_header_contents = File.read("#{__dir__}/cpp/raylib/header.txt")
  make_contents = File.read("#{__dir__}/cpp/raylib/linux_make.txt")

  Dir.mkdir('new_CPP_raylib_project_linux')
  Dir.mkdir('new_CPP_raylib_project_linux/src')
  Dir.mkdir('new_CPP_raylib_project_linux/include')

  File.write("new_CPP_raylib_project_linux/src/main.cpp", ray_main_contents)
  File.write("new_CPP_raylib_project_linux/include/main.hpp", ray_header_contents)
  File.write("new_CPP_raylib_project_linux/makefile", make_contents)
end


def make_opengl_mac()
  gl_main_contents = File.read("#{__dir__}/cpp/opengl/main.txt")
  gl_header_contents = File.read("#{__dir__}/cpp/opengl/header.txt")
  make_contents = File.read("#{__dir__}/cpp/opengl/make_mac.txt")


  Dir.mkdir("new_openGL_project_mac")
  Dir.mkdir("new_openGL_project_mac/src")
  Dir.mkdir("new_openGL_project_mac/include")

  File.write("new_openGL_project_mac/src/main.cpp", gl_main_contents)
  File.write("new_openGL_project_mac/include/main.hpp", gl_header_contents)
  File.write("new_openGL_project_mac/makefile", make_contents)
end

def make_opengl_linux()
  gl_main_contents = File.read("#{__dir__}/cpp/opengl/main.txt")
  gl_header_contents = File.read("#{__dir__}/cpp/opengl/header.txt")
  make_contents = File.read("#{__dir__}/cpp/opengl/make_linux.txt")


  Dir.mkdir("new_openGL_project_linux")
  Dir.mkdir("new_openGL_project_linux/src")
  Dir.mkdir("new_openGL_project_linux/include")

  File.write("new_openGL_project_linux/src/main.cpp", gl_main_contents)
  File.write("new_openGL_project_linux/include/main.hpp", gl_header_contents)
  File.write("new_openGL_project_linux/makefile", make_contents)
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
    puts "make-proj --cpp -r --linux: generate a new linux C++ raylib project"
    puts "make-proj --cpp -gl --linux: generate a new OpenGL linux project"
    puts "make-proj --cpp -gl --mac: generate a new OpenGL macOS project"
    puts ""
    puts "make-proj --cpp -t: generate a new C++ terminal project (should work on both linux AND mac)"
    puts ""
    puts "make-proj --rb: generate a new Ruby project"
    puts "make-proj --cs: generate a new C# project"
    puts ""
    puts "make-proj --mfile -r --mac: generate a macOS specific raylib makefile"
    puts "make-proj --mfile -r --linux: generate a linux specific raylib makefile"
    puts "make-proj --mfile -gl --linux: generate a linux specific openGL makefile"
    puts "make-proj --mfile -gl --mac: generate a macOS specific openGL makefile"
    puts "make-proj --mfile -t: generate a terminal makefile (should work on both linux AND mac)"
    puts ""
    puts "make-proj --update: update your current make-proj config saved in your shell system"
    puts "make-proj --help: you're using this one right now! :)"
    puts "------------------------------------------------------"
end
