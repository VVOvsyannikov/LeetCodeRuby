# frozen_string_literal: true

class Trie
  class Node
    attr_accessor :children, :terminal

    def initialize
      @children = {}
      @terminal = false
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
    end
    node.terminal = true
  end

  def search(word)
    node = @root
    word.each_char do |char|
      children = node.children[char]
      return false unless children

      node = children
    end
    node.terminal
  end

  def starts_with(prefix)
    node = @root
    prefix.each_char do |char|
      return false unless node.children[char]

      node = node.children[char]
    end
    true
  end
end
