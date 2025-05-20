# frozen_string_literal: true

def min_cost_climbing_stairs(cost)
  cache = {}
  n = cost.size

  inner = lambda do |step|
    return 0 if step <= 1
    return cache[step] if cache[step]

    cache[step] = [cost[step - 1] + inner.call(step - 1), cost[step - 2] + inner.call(step - 2)].min
  end

  inner.call(n)
  cache[n]
end

def min_cost_climbing_stairs_dp(cost)
  n = cost.size
  dp = Array.new(n + 1) { 0 }

  (2...n + 1).each do |i|
    dp[i] = [dp[i - 1] + cost[i - 1], dp[i - 2] + cost[i - 2]].min
  end

  dp[n]
end
