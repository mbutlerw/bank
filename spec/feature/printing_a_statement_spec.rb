describe "logging a transaction" do
  it "logs the correct transaction for a deposit" do
    account = Account.new
    account.deposit(20)

    expect(account.logger.print_log).to eq "date || type || value || balance
08/10/2016 || deposit || 20 || 20"
  end
end
