require 'spec_helper'

describe Csvstack2 do
  include SpecHelper
  it "stacks 2 csv files" do
    out = run 'csvstack2', 'a_b.csv', 'a_b.csv'
    assert_csv(out, %{
      a,b
      1,2
      1,2
    })
    File.unlink out
  end

  it "stacks 3 csv files" do
    out = run 'csvstack2', 'a_b.csv', 'a_b.csv', 'a_b.csv'
    assert_csv(out, %{
      a,b
      1,2
      1,2
      1,2
    })
    File.unlink out
  end

  it "stacks csv files with same headers in different order" do
    out = run 'csvstack2', 'a_b.csv', 'b_a.csv'
    assert_csv(out, %{
      a,b
      1,2
      1,2
    })
    File.unlink out
  end
end
