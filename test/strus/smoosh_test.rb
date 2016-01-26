require 'test_helper'

describe Strus::Smoosh do
  before do
    Strus.smoosh_the_world
    @test_string = " I <3 ruby\n\nyes I do    "
    @test_array = [@test_string, " w00t\n w00t ", "\t\they he\ny"]
    @nested_array = [@test_string, @test_array]
    @test_hash = {
      @test_string => @nested_array,
      foo: 'bar'
    }
    @array_with_hash = ["hi\n", @test_hash, "\tbye"]
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

  it 'smooshes each string in an array and joins them' do
    @test_array.smoosh.must_equal 'I<3rubyyesIdow00tw00theyhey'
  end

  it 'smooshes nested arrays' do
    @nested_array.smoosh.must_equal 'I<3rubyyesIdoI<3rubyyesIdow00tw00theyhey'
  end

  it 'smooshes hashes' do
    @test_hash.smoosh.must_equal 'I<3rubyyesIdoI<3rubyyesIdoI<3rubyyesIdow00tw00theyheyfoobar'
  end

  it 'smooshes arrays that contain hashes' do
    @array_with_hash.smoosh.must_equal 'hiI<3rubyyesIdoI<3rubyyesIdoI<3rubyyesIdow00tw00theyheyfoobarbye'
  end
end
