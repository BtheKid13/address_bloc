require_relative "../models/address_book"

RSpec.describe AddressBook do
  describe "attributes" do
    it "should respond to entries" do
      book = AddressBook.new
      expect(book).to respond_to(:entries)
    end

    it "should initialize entries as an array" do
      book = AddressBook.new
      expect(book.entries).to be_a(Array)
    end

    it "should initialize entries as empty" do
      book = AddressBook.new
      expect(book.entries.size).to eq(0)
    end
  end
    describe "#add_entry" do
      it "adds an entry to the address book" do
        book = AddressBook.new
        book.add_entry("Wil Burke", "813.282.3332", "hello@gmail.com")
        expect(book.entries.size).to eq(1)
      end
      it "adds the correct information to entries" do
        book = AddressBook.new
        book.add_entry("Wil Burke", "813.282.3332", "hello@gmail.com")
        new_entry = book.entries[0]

        expect(new_entry.name).to eq("Wil Burke")
        expect(new_entry.phone_number).to eq("813.282.3332")
        expect(new_entry.email).to eq("hello@gmail.com")
    end
  end
    describe "#remove_entry" do
      it "removes an entry using the address book info" do
        book = AddressBook.new
        book.add_entry("Jessie James", "813.431.0278", "jj@gmail.com")

        name = "Wil Burke"
        phone_number = "813.282.3332"
        email = "hello@gmail.com"
        book.add_entry(name, phone_number, email)

        expect(book.entries.size).to eq 2
        book.remove_entry(name, phone_number, email)
        expect(book.entries.size).to eq 1
        expect(book.entries.first.name).to eq("Jessie James")

    end
  end
end
