describe Printer do
  describe "::print" do
    it "returns a formatted version of log as a string" do
      expected_output =  "date || type || value || balance
01/14/2012 || withdraw || 500 || 2500
01/13/2012 || deposit || 2000 || 3000
01/10/2012 || deposit || 1000 || 1000"

      log_array = [
        {date: Date.new(2012, 1, 14), type: :withdraw, value: 500, balance: 2500},
        {date: Date.new(2012, 1, 13), type: :deposit, value: 2000, balance: 3000},
        {date: Date.new(2012, 1, 10), type: :deposit, value: 1000, balance: 1000}
      ]
      expect(Printer.print(log_array)).to eq (expected_output)
    end
  end
end
