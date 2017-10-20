require "spec_helper"

describe "nqueens" do
  
  it "test nqueens with n=4" do
    expect(nqueens(4)).to eq("-*--\n---*\n*---\n--*-")
  end

  it "test nqueens with n=5" do
    expect(nqueens(5)).to eq("*----\n---*-\n-*---\n----*\n--*--")
  end

#teste de n rainhas < 3
  it "test nqueens with n=3" do
    expect(nqueens(3)).to eq("ERRO")
  end

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

#teste de numero maior que 4000
  it "generates roman numeral for 4001" do
    expect(romanNumeral(4001)).to eq("ERRO")
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

end
