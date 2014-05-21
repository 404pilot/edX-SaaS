module FunWithStrings
  def palindrome?
    characters = self.downcase.gsub(/[^\w]/,"")

    characters == characters.reverse
  end

  def count_words
    all_words = self.downcase.strip.split(/\W+/)
    
    all_words.uniq.reduce(Hash.new) { |result,word| result.merge({word => all_words.count(word)}) }
  end

  def anagram_groups
    words = self.downcase.strip.split(/\W+/)

    # {"nba"=>"abn"}
    word_with_sortedChars = words.reduce(Hash.new) {| acc, word| acc.merge({word => word.chars.sort.join}) }

    word_with_sortedChars.values.uniq.reduce(Array.new) do |result, sorted_chars|
      result << word_with_sortedChars.map {|k,v| v==sorted_chars ? k:nil}.compact
    end
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end