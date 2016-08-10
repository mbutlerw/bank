describe Logger do

  subject(:logger) {described_class.new(printer)}

  let(:printer) {double :Printer, print: "a string"}

  describe "#log" do
    it "is empty at initialization" do
      expect(logger.log).to be_empty
    end
  end

  describe "#create_entry" do
    it "creates a new hash containing the relevent information" do
      logger.create_entry(:deposit, 50, 950)
      entry = { date: Date.today, type: :deposit, value: 50, balance: 950}
      expect(logger.log).to include entry
    end
  end

  describe "#print_log" do
    it "calls print on printer with correct arguements" do
      logger.create_entry(:deposit, 50, 950)
      entry = { date: Date.today, type: :deposit, value: 50, balance: 950}

      expect(printer).to receive(:print).with([entry])
      logger.print_log
    end

    it "returns a whatever Printer returns to it" do
      expect(logger.print_log).to eq "a string"
    end
  end
end
