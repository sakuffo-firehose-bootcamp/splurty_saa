require 'rails_helper'

RSpec.describe Quote do

  it "is not valid without a saying and an author" do
    quote = Quote.new
    expect(quote).not_to be_valid
  end

  it "saying should not be longer than 140 or shorter than 3 characters" do 
    quote = Quote.new(saying: 'a' * 141, author: 'a' * 3 )
    expect(quote).not_to be_valid

    quote = Quote.new(saying: 'a' * 2, author: 'a' * 3 )
    expect(quote).not_to be_valid
  end

  it "author's name should not be longer than 50 or shorter than 3 characters" do
    quote = Quote.new(saying: 'a' * 50, author: 'a' * 51 )
    expect(quote).not_to be_valid

    quote = Quote.new(saying: 'a' * 50, author: 'a' * 2 )
    expect(quote).not_to be_valid
  end

  it "Quote should be valid if attributes and exist and length rules are not broken" do
    quote = Quote.new(saying: 'a' * 140, author: 'a' * 50 )
    expect(quote).to be_valid
  end
end