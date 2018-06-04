class Calculation
  def initialize(input)
    @input = input
  end

  def result
    # remove outer whitespace
    @input.strip!

    # perform all multiplication and division
    while match = /(\d+(?:\.\d+)?)\s*(\*|\/)\s*(\d+(?:\.\d+)?)/.match(@input)
      # binding.pry
      substring, a, operator, b = match.to_a
      case operator
      when '*' then number = a.to_f * b.to_f
      when '/' then number = a.to_f / b.to_f
      end
      number = number.to_i if number % 1 == 0
      @input.sub!(substring, number.to_s)
    end

    # perform all addition and subtraction
    while match = /(\d+(?:\.\d+)?)\s*(\+|-)\s*(\d+(?:\.\d+)?)/.match(@input)
      substring, a, operator, b = match.to_a
      case operator
      when '+' then number = a.to_f + b.to_f
      when '-' then number = a.to_f - b.to_f
      end
      number = number.to_i if number % 1 == 0
      @input.sub!(substring, number.to_s)
    end

    # validate result and check for floats
    if /^-?\d+$/ =~ @input
      @input.to_i
    elsif /^-?\d+\.\d+$/ =~ @input
      @input.to_f.round(2)
    else
      "Invalid input"
    end
  end
end