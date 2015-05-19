require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/pride'
# require 'pry'

# your code here

describe 'extracting hashtags from text' do
  it 'extracts hashtags from text' do
    Hashtag.get_hashtags('#sorrynotsorry').must_equal ['sorrynotsorry']
  end

  it 'extracts hashtags when there are other words' do
    Hashtag.get_hashtags('Hello #world yeah').must_equal ['world']
  end

  it 'it only extracts the word when there are multiple #s' do
    Hashtag.get_hashtags('##live').must_equal ['live']
  end

  it 'extracts multiple hashtags' do
    Hashtag.get_hashtags('#Hello #world yeah').must_equal ['Hello', 'world']
  end

  it 'does not extract #s alone' do
    Hashtag.get_hashtags('# # # #').must_be_empty
  end

  it 'does not extract hashtags starting with numbers' do
    Hashtag.get_hashtags('#123hi').must_be_empty
  end

  it 'does not extract hashtags starting with special characters' do
    Hashtag.get_hashtags('#?what').must_be_empty
  end

  it 'does not extract hashtags in the middle of a word' do
    Hashtag.get_hashtags('hello#world').must_be_empty
  end
end
