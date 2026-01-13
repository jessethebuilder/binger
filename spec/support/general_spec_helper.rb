module GeneralSpecHelper
  def not_this(value, from: nil)
    if from
      (from - [value]).sample
    else
      "#{value} #{Faker::Lorem.word}"
    end
  end

  def wait_until(tries: 3)
    counter = 0
    loop do
      return true if yield

      counter += 1

      raise StandardError, "#wait_until timed out after #{counter} tries." if counter == tries

      sleep 0.3
    end
  end
end
