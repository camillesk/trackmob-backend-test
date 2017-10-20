require "spec_helper"

describe "nqueens" do
  
  it "test nqueens with n=4" do
    expect(nqueens(4)).to eq("-*--\n---*\n*---\n--*-")
  end

  it "test nqueens with n=5" do
    expect(nqueens(5)).to eq("*----\0---*-\n-*---\n----*\n--*--")
  end

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

describe "parentheses" do

#fechamento antes de abertura
  it "check if {{)(}} is balanced" do
    expect(parentheses("{{)(}}")).to eq(false)
  end
  
#fechamento desbalanceado
  it "check if ({)} is balanced" do
    expect(parentheses("({)}")).to eq(false)
  end

#mais aberturas que fechamentos
  it "check if ({[{}]) is balanced" do
    expect(parentheses("({)}")).to eq(false)
  end

#mais fechamentos que aberturas
  it "check if {[[{}]} is balanced" do
    expect(parentheses("({)}")).to eq(false)
  end

#testes corretos
  it "check if [({})] is balanced" do
    expect(parentheses("[({})]")).to eq(true)
  end
  
  it "check if {}([]) is balanced" do
    expect(parentheses("{}([])")).to eq(true)
  end

  it "check if {()}[[{}]] is balanced" do
    expect(parentheses("{()}[[{}]]")).to eq(true)
  end
