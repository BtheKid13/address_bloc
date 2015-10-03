

def what_up
  greeting = ARGV.shift
  ARGV.each do |name|
    puts "#{greeting} #{name}"
  end
end

what_up

# def main_menu(num)
#   get.chomp
#   case
#   when 1
#     puts "hello"
#     main_menu
#   when 2
#   when 3
#     puts "hello3"
# end
#
#
# main_menu(2)
