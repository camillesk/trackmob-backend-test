require "spec_helper"

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
