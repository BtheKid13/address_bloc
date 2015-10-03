require_relative 'controllers/menu_controller'

menu = MenuController.new

# system is a direct command to the command line
system "clear"
puts "Welcome to AddressBloc!"

# Displays the main menu that we just built!
menu.main_menu
