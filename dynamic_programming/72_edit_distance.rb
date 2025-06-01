# frozen_string_literal: true

def min_distance(word1, word2)
  levenstain = lambda do |a, b|
    return a.size + b.size if a.empty? || b.empty?
    return levenstain.call(a[1..], b[1..]) if a[0] == b[0]

    [
      levenstain.call(a[1..], b),
      levenstain.call(a, b[1..]),
      levenstain.call(a[1..], b[1..])
    ].min + 1
  end

  levenstain.call(word1, word2)
end

def min_distance_II(word1, word2)
  a = word1.size
  b = word2.size
  dp = Array.new(a + 1, 0) { Array.new(b + 1, 0) }

  (1..b).each do |i|
    dp[0][i] = dp[0][i - 1] + 1
  end

  (1..a).each do |i|
    dp[i][0] = dp[i - 1][0] + 1

    (1..b).each do |j|
      dp[i][j] = if word1[i - 1] == word2[j - 1]
                   dp[i - 1][j - 1]
                 else
                   [dp[i - 1][j - 1], dp[i][j - 1], dp[i - 1][j]].min + 1
                 end
    end
  end

  dp[a][b]
end
