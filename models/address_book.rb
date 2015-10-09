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

  def iterative_search(name)
    @entries.each do |entry|

      if entry.name == name
        return entry
      else
        return nil
      end
    end
  end


  def binary_search(name)
    #1
    lower = 0
    upper = entries.length - 1

    #2
    while lower <= upper
    #3
      mid = (lower + upper) / 2
      mid_name = entries[mid].name

    #4
      if name == mid_name
        return entries[mid]
      elsif name < mid_name
        upper = mid - 1
      elsif name > mid_name
        lower = mid + 1
      end
    end
    return nil #5
  end
end
