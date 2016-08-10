class Printer

  def self.print(log_array)
    formatted_arr = log_array.map{ |entry|
      "#{entry[:date].strftime("%m/%d/%Y")} || #{entry[:type]} || #{entry[:value]} || #{entry[:balance]}"
    }

   return "date || type || value || balance\n" + formatted_arr.join("\n")
  end
end
