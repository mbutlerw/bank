require 'Date'
require_relative 'printer.rb'

class Logger

  attr_reader :log

  def initialize(printer = Printer)
    @printer = printer
    @log = []
  end

  def create_entry(type, value, balance)
    @log << { date: Date.today, type: type, value: value, balance: balance}
  end

  def print_log
    printer.print(log)
  end

  private

  attr_reader :printer

end
