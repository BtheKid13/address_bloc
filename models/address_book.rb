require_relative 'entry'
require "csv"

class AddressBook
  attr_accessor :entries

  def initialize
    @entries = []
  end

  def remove_entry(name, phone_number, email)
    delete_entry = nil
    @entries.each do |x|
      if name == x.name && phone_number == x.phone_number && email == x.email
        delete_entry = x
      end
    end
      @entries.delete(delete_entry)
  end

  def add_entry(name, phone_number, email)
    index = 0
    @entries.each do |entry|
      if name < entry.name
        break
      end
      index += 1
    end
    @entries.insert(index, Entry.new(name, phone_number, email))
  end

    #7
  def import_from_csv(file)
    csv_text = File.read(file)
    csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
    #8
    csv.each do |row|
      row_hash = row.to_hash # <-converts each item in csv into a symbol to be used in a hash
      add_entry(row_hash["name"], row_hash["phone_number"], row_hash["email"])
    end

  end
end
