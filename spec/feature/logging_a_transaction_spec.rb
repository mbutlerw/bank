describe "logging a transaction" do
  it "logs the correct transaction for a deposit" do
    account = Account.new
    account.deposit(20)

    entry = { date: Date.today, type: :deposit, value: 20, balance: 20}
    
    expect(account.logger.log).to include entry
  end
end
