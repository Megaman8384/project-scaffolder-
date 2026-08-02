require_relative "func.rb"
terminal = TermCpp.new
raylib = RayCpp.new

puts "======================"
puts "| project scaffolder |"
puts "======================"
puts "  1) new Ruby Project"
puts "  2) new CPP project"
puts "  3) new C# project"
puts "-----------------------"
print "ENTER: "
input = gets.chomp.to_i
puts "-----------------------"

case input
when 1
    makeRB()
    puts "your Ruby project is ready!"
    puts "-----------------------"
when 2
    puts "Raylib or Terminal?"
    puts "-----------------------"
    rayORterm = gets.chomp 
    if rayORterm == "raylib" || rayORterm == "Raylib"
        raylib.make_ray_CPP()
        puts "-----------------------"
        puts "your raylib project is ready!"
    elsif rayORterm == "terminal" || rayORterm == "Terminal"
        terminal.make_terminal_CPP()
        puts "-----------------------"
        puts "your terminal project is ready!"
    else 
        puts "invalid option"
    end
when 3
    makeCS()
    puts "your C# project is ready!"
    puts "-----------------------"
else 
    puts "invalid option"
    puts "-----------------------"
end 





