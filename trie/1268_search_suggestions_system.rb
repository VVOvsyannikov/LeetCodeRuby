# frozen_string_literal: true

class Trie
  class Node
    attr_accessor :children, :words

    def initialize
      @children = {}
      @words = []
    end
  end

  def initialize
    @root = Node.new
  end

  def insert(word)
    node = @root
    word.each_char do |char|
      node.children[char] = Node.new unless node.children[char]

      node = node.children[char]
      node.words << word
    end
  end

  def starts_with(prefix)
    node = @root
    prefix.each_char do |char|
      return [] unless node.children[char]

      node = node.children[char]
    end
    node.words
  end
end

def suggested_products(products, search_word)
  trie = Trie.new
  products.each { trie.insert(_1) }

  result = []
  search_word.size.times do |i|
    result << trie.starts_with(search_word[..i]).sort[..2]
  end

  result
end
