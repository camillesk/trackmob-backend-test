require "spec_helper"

describe "roman numerals" do

#teste unidade
  it "generates roman numeral for 7" do
    expect(romanNumeral(7)).to eq("VII")
  end

#teste dezena com final zero
  it "generates roman numeral for 10" do
    expect(romanNumeral(10)).to eq("X")
  end

#teste centena com zero no meio
  it "generates roman numeral for 204" do
    expect(romanNumeral(204)).to eq("CCIV")
  end
 
#teste milhar com zero no fim e no meio  
  it "generates roman numeral for 1090" do
    expect(romanNumeral(1090)).to eq("MXC")
  end

#teste de ordem de conversao corrreta, como dito na especificação
  it "generates roman numeral for 999" do
    expect(romanNumeral(999)).to eq("CMXCIX")
  end
end
