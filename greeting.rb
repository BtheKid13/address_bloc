

def what_up
  greeting = ARGV.shift
  ARGV.each do |name|
    puts "#{greeting} #{name}" 
  end
end

what_up
