def makeRB()
    main_contents = File.read("rb/main.txt")
    def_contents = File.read("rb/def.txt")

    Dir.mkdir('new_ruby_project')
    File.write("new_ruby_project/main.rb", main_contents)
    File.write("new_ruby_project/def.rb", def_contents)
end

def makeCS()
    cs_contents = File.read("cs/main.txt")

    Dir.mkdir('new_C#_project')
    File.write("new_C#_project/main.cs", cs_contents)
end


class TermCpp

    def make_terminal_CPP()

        cpp_main_contents = File.read("cpp/terminal/main.txt")
        hpp_contents = File.read("cpp/terminal/header.txt")
        make_contents = File.read("cpp/terminal/makefile.txt")

        Dir.mkdir('new_CPP_teminal_project')
        File.write("new_CPP_teminal_project/main.cpp", cpp_main_contents)
        File.write("new_CPP_teminal_project/main.hpp", hpp_contents)
        File.write("new_CPP_teminal_project/makefile", make_contents)

    end
end

class RayCpp

    def make_ray_CPP()
        ray_main_contents = File.read("cpp/raylib/main.txt")
        ray_header_contents = File.read("cpp/raylib/header.txt")
        ray_make_contents = File.read("cpp/raylib/make.txt")

        Dir.mkdir('new_CPP_raylib_project')

        File.write("new_CPP_raylib_project/main.cpp", ray_main_contents)
        File.write("new_CPP_raylib_project/main.hpp", ray_header_contents)
        File.write("new_CPP_raylib_project/makefile", ray_make_contents)
    end

end