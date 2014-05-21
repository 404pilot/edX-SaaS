module FunWithStrings
  def palindrome?
    characters = self.downcase.gsub(/[^\w]/,"")

    characters == characters.reverse
  end

  def count_words
    words = self.downcase.strip.split(/\W+/)
    keys = words.uniq

    result = Hash.new

    keys.each { |x| result.store(x, words.count(x)) }

    result
  end

  def anagram_groups
    words = self.downcase.strip.split(/\W+/)

    word_with_sortedChars = Hash.new

    words.each { |x| word_with_sortedChars.store(x, x.chars.sort.join) }

    allChars = word_with_sortedChars.values.uniq

    result = Array.new

    allChars.each { |x| result.push(word_with_sortedChars.map {|k,v| v==x ? k:nil}.compact ) }

    result
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end