require 'test_helper'

describe Strus::Smoosh do
  before do
    @test_string = " I <3 ruby\n\nyes I do    "
  end

  it 'has a version number' do
    ::Strus::Smoosh::VERSION.wont_be_nil
  end

  it 'removes whitespace from strings' do
    @test_string.smoosh.wont_match ' '
  end

  it 'smooshes the content of a string' do
    @test_string.smoosh.must_equal 'I<3rubyyesIdo'
  end
end
