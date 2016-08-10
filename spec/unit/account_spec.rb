
describe Account do

  subject(:account) {described_class.new(logger)}

  let(:logger) {double :logger, create_entry: nil}


  describe "#deposit" do
    it "adds passed value to current balance" do
      account.deposit(10)
      expect(account.balance).to eq 10
    end

    it "calls create entry with correct arguments" do
      expect(logger).to receive(:create_entry).with(:deposit, 10, 10)
      account.deposit(10)
    end
  end

  describe "#balance" do

    it "is 0 at initialization" do
      expect(account.balance).to eq 0
    end

    it "returns the current value of balance" do
      account.deposit(20)
      expect(account.balance).to eq 20
    end
  end

  describe "#withdraw" do
    it "returns the passed value" do
      account.deposit(20)
      expect(account.withdraw(10)).to eq 10
    end

    it "removes the passed value from the current value of balance" do
      account.deposit(20)
      account.withdraw(10)
      expect(account.balance).to eq 10
    end

    it "calls create entry with correct arguments" do
      account.deposit(50)
      expect(logger).to receive(:create_entry).with(:withdraw, 20, 30)
      account.withdraw(20)
    end

  end
end
