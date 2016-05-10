require 'rspec'
require 'spec_helper'
require 'a00'

describe "#caesar_cipher" do
  it "encodes a simple word" do
    expect(caesar_cipher("aaa", 11)).to eq("lll")
  end

  it "wraps around the alphabet" do
    expect(caesar_cipher("zzz", 1)).to eq("aaa")
  end

  it "encodes multiple words" do
    expect(caesar_cipher("catz hatz", 2)).to eq("ecvb jcvb")
  end
end

describe "#digital_root" do
  it "calculates the digital root of a single-digit number" do
    expect(digital_root(9)).to eq(9)
  end

  it "calculates the digital root of a larger number" do
    expect(digital_root(4322)).to eq(2)
  end

  it "does not call #to_s on the argument" do
    expect_any_instance_of(Fixnum).to_not receive(:to_s)
    digital_root(4322)
  end
end

describe "#jumble_sort" do
  it "defaults to alphabetical order" do
    expect(jumble_sort("hello")).to eq("ehllo")
  end

  it "takes an alphabet array and sorts by that order" do
    alph = ("a".."z").to_a
    hello = "hello".chars.uniq
    alph -= hello
    alphabet = (hello += alph)

    expect(jumble_sort("hello", alphabet)).to eq("hello")
  end

  it "sorts by a reversed alphabet" do
    reverse = ("a".."z").to_a.reverse
    expect(jumble_sort("hello", reverse)).to eq("ollhe")
  end
end

describe "#dups?" do
  it "detects a single duplicated value" do
    expect([1, 3, 0, 1].dups?).to be_truthy
  end

  it "detects multiple duplicated values" do
    expect([1, 3, 0, 3, 1].dups?).to be_truthy
  end

  it "detects values duplicated more than once" do
    expect([1, 3, 4, 3, 0, 3].dups?).to be_truthy
  end

  it "returns false when no duplicates are found" do
    expect([1, 3, 4, 5].dups?).to be_falsey
  end
end

describe "symmetrical?" do
  it "detects palindromes with an odd number of letters" do
    word = "racecar"
    expect(word.symmetrical?).to be_truthy
  end

  it "detects palindromes with an even number of letters" do
    word = "toot"
    expect(word.symmetrical?).to be_truthy
  end

  it "doesn't detect false positives" do
    word = "racelikecar"
    expect(word.symmetrical?).to be_falsey
  end

  it "can handle multi word palindromes" do
    sentence = "too hot to hoot"
    expect(sentence.symmetrical?).to be_truthy
  end

  it "doesn't call String#reverse" do
    word = "racelikecar"

    expect(word).not_to receive(:reverse)
    expect(word).not_to receive(:reverse!)

    word.symmetrical?
  end
end

describe "#factors" do
  it "returns the factors of 10 in order" do
    expect(factors(10)).to eq([1, 2, 5, 10])
  end

  it "returns just two factors for primes" do
    expect(factors(13)).to eq([1, 13])
  end
end

