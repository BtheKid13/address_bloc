require_relative '../models/entry' #The file that we're testing!

# This is the standard first line of an RSpec test file.
#It identifies itself as a test file and that it's testing Entry
RSpec.describe Entry do
  describe "attributes" do
    it "should respond to name" do
      entry = Entry.new('Wil Burke', '813.431.0278', 'wilburke@gmail.com')
      expect(entry).to respond_to(:name)
    end

    it "should respond to phone number" do
      entry = Entry.new('Wil Burke', '813.431.0278', 'wilburke@gmail.com')
      expect(entry).to respond_to(:phone_number)
    end

    it "should respond to email" do
      entry = Entry.new('Wil Burke', '813.431.0278', 'wilburke@gmail.com')
      expect(entry).to respond_to(:email)
    end
  end
# The pound symbol means that to_s is an instance variable
  describe "#to_s" do
    it "prints an entry as a string" do
      entry = Entry.new('Wil Burke', '813.431.0278', 'wilburke@gmail.com')
      expected_string = "Name: Wil Burke\nPhone Number: 813.431.0278\nEmail: wilburke@gmail.com"
# eq is used to check that to_s equals the expected_string
      expect(entry.to_s).to eq(expected_string)
    end
  end
end
