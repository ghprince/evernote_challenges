#!/usr/bin/env ruby
# Frequency Counting of Words / Top N words in a document.
# Given N terms, your task is to find the k most frequent terms from given N terms.
# Input format
# First line of input contains N, denoting the number of terms to add.
# In each of the next N lines, each contains a term.
# Next line contains k, most frequent terms.
# Output format
# Print the k most frequent terms in descending order of their frequency. If two terms have same frequency print them in lexicographical order.
# Sample input
# 14
# Fee
# Fi
# Fo
# Fum
# Fee
# Fo
# Fee
# Fee
# Fo
# Fi
# Fi
# Fo
# Fum
# Fee
# 3
# Sample output
# Fee
# Fo
# Fi
# Constraint
# 0 < N < 300000
# 0 < term length < 25.

class Wordlist < Hash
  def add(word)
    has_key?(word) ? self[word] += 1 : self[word] = 1
  end
  def most(k)
    sorted_keys = keys.sort do |x,y|
      if self[x] > self[y]
        -1
      elsif self[x] < self[y]
        1
      elsif x > y
        1
      elsif y > x
        -1
      else
        0
      end
    end
    sorted_keys.shift(k)
  end
end

wordlist = Wordlist.new
size = gets.chomp.to_i
size.times { wordlist.add gets.chomp.to_s }
k = gets.chomp.to_i
wordlist.most(k).each { |elem| puts elem }
