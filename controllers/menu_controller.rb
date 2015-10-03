require_relative '../models/address_book'
#Pulling all of the values from models/address_book.rb!

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
    #haven't seen this before, but it makes sense.
    #You reference the creation of a new AddressBook entry with an instance variable that can be used thoughout this program!
  end

  def main_menu  #This shows the total number of entries that are listed
    puts "Main Menu - #{@address_book.entries.size} entries"
    puts "1 - View all entries"
    puts "2 - Create an Entry"
    puts "3 - Search for an Entry"
    puts "4 - Import entries from CSV"
    puts "5 - View Entry Number"
    puts "6 - Dip out (Exit)"
    print "Enter your selection:"

    selection = gets.to_i
    # Case Statement! Solid refresher. Each choice has a seperate route.
    # So think of Case Statements as a a signpost. Each route you take has different conditions
    case selection
    when 1
      system "clear"
      view_all_entries
      main_menu
    when 2
      system "clear"
      create_entry
      main_menu
    when 3
      system "clear"
      search_entries
      main_menu
    when 4
      system "clear"
      read_csv
      main_menu
    when 5
      system "clear"
      p "Please specify the entry number:"
      number = gets.chomp
      h = {}
      @address_book.entries.each do |entry|
      h << :index entry
      index += 1
        if number == index
          puts entry
        end
      end
    when 6
      puts "Peace, dog."
      exit(0)
      # exit(0) signals that the program is ending without an error
    else
      # Saftey net! This is incase the user messes up. it tells them to fix it and send them back to the main_menu
      # system "clear" is the key here. it clears the screen again so that the menu can be displayed on a blank slate
      system "clear"
      puts "Dude, I can't undertand you. Pick a freaking number"
      main_menu
    end
  end
    # The methods that are referenced in the menu.
    # I could move them, but its prob better to keep them bundled with the menu. Readability!
  def view_all_entries
    @address_book.entries.each do |entry|
      system 'clear'
      puts entry.to_s

      entry_submenu(entry)
    end
    system "clear"
    puts "End of Entries"
  end

  def create_entry
    system "clear"
    puts "New AddressBloc Entry"
    # These variable are able to plug directly into the add_entry method as arguments.
    # It's like reversing the argument flow, but it totally makes sense.
    print "name:"
    name = gets.chomp
    print "phone number:"
    phone_number = gets.chomp
    print "email:"
    email = gets.chomp
    @address_book.add_entry(name, phone_number, email)
    system "clear"
    puts "Got it! Thanks for your contribution."
  end

  def search_entries
  end

  def read_csv
  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"


    selection = gets.chomp

    case selection

    when "n"

    when "d"

    when "e"

    when "m"
      system "clear"
      main_menu

    else
      system "clear"
      puts "Sorry, #{selection} is wrong. Please the options given"
      entry_submenu(entry)
    end
  end
end
