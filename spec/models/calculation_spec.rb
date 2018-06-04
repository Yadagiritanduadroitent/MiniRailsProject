require 'rails_helper'

RSpec.describe Calculation, type: :model do

  it 'stores the input in class variable' do 
    input = '1+2*3+4/5'
    object = Calculation.new(input)
    expect(object.instance_variable_get(:@input)).to eq(input)
  end

  it 'results in invalid input if expression is empty' do 
    input = ''
    result = Calculation.new(input).result
    expect(result).to eq("Invalid input")
  end
  it 'results in invalid input if expression is not valid' do 
    input = '**'
    result = Calculation.new(input).result
    expect(result).to eq("Invalid input")
  end

  it 'result in invalid input if expression is not balanced' do 
    input = '1*2+'
    result = Calculation.new(input).result
    expect(result).to eq("Invalid input")
  end

  it 'results in invalid input if expression not contains alphabhet characters' do 
    input = '1*2+a'
    result = Calculation.new(input).result
    expect(result).to eq("Invalid input")
  end

  it 'results in invalid input if expression not contains not arthematic symbols' do 
    input = '1*2#@'
    result = Calculation.new(input).result
    expect(result).to eq("Invalid input")
  end

  it 'reults in float if answer is float' do 
    input = '1.0+2.1'
    result = Calculation.new(input).result
    expect(result).to eq(3.1)
  end  

  it 'results to be rounded to 0 decimals ' do 
    input = '1.0+2.0'
    result = Calculation.new(input).result
    expect(result).to eq(3)
  end 

  it 'removes the white space from the input' do 
    input = '1.0 + 2.0'
    result = Calculation.new(input).result
    expect(result).to eq(3)
  end

  it 'works from long numbers ' do 
    input = '100000000000 * 2000000'
    result = Calculation.new(input).result
    expect(result).to eq(200000000000000000)
  end


  it 'works for given test case 5*3+1+6/2+9*100' do 
    input = '5*3+1+6/2+9*100'
    result = Calculation.new(input).result
    expect(result).to eq(919)
  end

  it 'works for given test case  5*3+1+6/85+9*100' do 
    input = ' 5*3+1+6/85+9*100'
    result = Calculation.new(input).result
    expect(result).to eq(916.07)
  end

end
