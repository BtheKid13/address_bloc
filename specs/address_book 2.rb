require_relative "../models/address_book"

RSpec.describe AddressBook do
  let(:book) { AddressBook.new }
  # ^ This assigns AddressBook.new to book. So you don't have to repeat it in every new instance.

  def check_entry(entry, expected_name, expected_number, expected_email)
    expect(entry.name).to eql expected_name
    expect(entry.phone_number).to eql expected_number
    expect(entry.email).to eql expected_email
  end

  describe "attributes" do

    it "should respond to entries" do
      expect(book).to respond_to(:entries)
    end

    it "should initialize entries as an array" do
      expect(book.entries).to be_a(Array)
    end

    it "should initialize entries as empty" do
      expect(book.entries.size).to eq(0)
    end
  end

  describe "#add_entry" do

    it "adds an entry to the AddressBook" do
        book.add_entry("Wil Burke", "813.282.3332", "hello@gmail.com")
        expect(book.entries.size).to eq(1)
    end

    it "adds the correct information to entries" do
        book.add_entry("Wil Burke", "813.282.3332", "hello@gmail.com")
        new_entry = book.entries[0]

        expect(new_entry.name).to eq("Wil Burke")
        expect(new_entry.phone_number).to eq("813.282.3332")
        expect(new_entry.email).to eq("hello@gmail.com")
    end
  end

  describe "#remove_entry" do

    it "removes an entry using the addressBook info" do
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

  describe "#import_from_csv" do

    it "imports the correct number of entries" do
      book.import_from_csv("entries.csv")
      book_size = book.entries.size

      expect(book_size).to eql 5
    end

    #4 ^^^ We need 5 entries in our test if we're going to point to 5 initially
    it "imports the 1st entry" do
      book.import_from_csv("entries.csv")
        # Check the first Entry
      entry_one = book.entries[0]
    #5
    check_entry(entry_one, "Bill", "555.555.4854", "bill@blocmail.com")
    end

    it "imports 2nd entry" do
      book.import_from_csv("entries.csv")
        #Check fro 2nd Entry
      entry_two = book.entries[1]

      check_entry(entry_two, "Bob", "555.555.5415", "bob@blocmail.com")
    end

    it "imports 3rd entry" do
      book.import_from_csv("entries.csv")
        #blah
      entry_three = book.entries[2]

      check_entry(entry_three, "Joe", "555.555.3660", "joe@blocmail.com")
    end

    it "imports 4th entry" do
      book.import_from_csv("entries.csv")
        #yup
      entry_four = book.entries[3]

      check_entry(entry_four, "Sally", "555.555.4646", "sally@blocmail.com")
    end

    it "imports 5th entry" do
      book.import_from_csv("entries.csv")
        #sheesh
      entry_five = book.entries[4]

      check_entry(entry_five, "Sussie", "555.555.2036", "sussie@blocmail.com")
    end
  end

  describe "importing files from entries_2.csv" do

    it "imports the correct number of files" do
      book.import_from_csv("entries_2.csv")

      expect(book.entries.size).to eq 3
    end
  end

  describe "#binary_search" do

    it "searches AddressBook for a non-exsistant entry" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Dan")
      expect(entry).to be_nil
    end

    it "searches AddressBook for Bill" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Bill")
       expect(entry).to be_a Entry
       check_entry(entry, "Bill", "555.555.4854", "bill@blocmail.com")
     end
   end

   it "searches AddressBook for Bob" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Bob")
      expect(entry).to be_a Entry
      check_entry(entry, "Bob", "555.555.5415", "bob@blocmail.com")
    end

    it "searches AddressBook for Joe" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Joe")
      expect(entry).to be_a Entry
      check_entry(entry, "Joe", "555.555.3660", "joe@blocmail.com")
    end

    it "searches AddressBook for Sally" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Sally")
      expect(entry).to be_a Entry
      check_entry(entry, "Sally", "555.555.4646", "sally@blocmail.com")
    end

    it "searches AddressBook for Sussie" do
      book.import_from_csv("entries.csv")
      entry = book.binary_search("Sussie")
      expect(entry).to be_a Entry
      check_entry(entry, "Sussie", "555.555.2036", "sussie@blocmail.com")
    end


    it "searches AddressBook for Billy" do
       book.import_from_csv("entries.csv")
       entry = book.binary_search("Billy")
       expect(entry).to be_nil
    end

    it "searches AddressBook for a non-existant entry" do
      book.import_from_csv("entries.csv")
      entry = book.iterative_search("Franco")
      expect(entry).to be_nil
    end

    it "searches AddressBook for Bill" do
      book.import_from_csv("entries.csv")
      entry = book.iterative_search("Bill")

      expect(entry).to be_a Entry
      check_entry(entry, "Bill", "555.555.4854", "bill@blocmail.com")
    end
  end
