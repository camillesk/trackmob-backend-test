require "spec_helper"

describe "nqueens" do
  
  it "test nqueens with n=4" do
    expect(nqueens(4)).to eq("-*--\n---*\n*---\n--*-")
  end

  it "test nqueens with n=5" do
    expect(nqueens(5)).to eq("*----\0---*-\n-*---\n----*\n--*--")
  end
  
end
