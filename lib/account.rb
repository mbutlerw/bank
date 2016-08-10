require_relative 'logger.rb'

class Account

  attr_reader :balance, :logger

  def initialize(logger = Logger.new)
    @logger = logger
    @balance = 0
  end

  def deposit(value)
    @balance += value
    logger.create_entry(:deposit, value, balance)
  end

  def withdraw(value)
    @balance -= value
    logger.create_entry(:withdraw, value, balance)
    return value
  end

end
