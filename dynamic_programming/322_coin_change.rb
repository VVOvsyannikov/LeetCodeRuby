# frozen_string_literal: true

def coin_change(coins, amount)
  return 0 if amount.zero?

  result = []

  recombinate = lambda do |sum, memo|
    return if sum.negative?
    return result << memo if sum.zero?

    coins.each do |coin|
      recombinate.call(sum - coin, memo + 1)
    end
  end
  recombinate.call(amount, 0)

  result.any? ? result.min : -1
end

def coin_change_II(coins, amount)
  return 0 if amount.zero?

  cache = {}

  recombinate = lambda do |sum, memo|
    return cache[sum] if cache[sum]
    return Float::INFINITY if sum.negative?
    return memo if sum.zero?

    cache[sum] = coins.map do |coin|
      recombinate.call(sum - coin, memo)
    end.min + 1
  end

  recombinate.call(amount, 0)

  cache[amount] == Float::INFINITY ? -1 : cache[amount]
end

def coin_change_III(coins, amount)
  return 0 if amount.zero?

  dp = [0]
  coins.each do |coin|
    dp[coin] = 1 if coin <= amount
  end

  (1..amount).each do |sum|
    next if dp[sum]

    result = coins.map do |coin|
      (sum - coin).positive? ? dp[sum - coin] : nil
    end.compact

    dp[sum] = result.any? ? result.compact.min + 1 : nil
  end

  dp[amount] || -1
end

def coin_change_IV(coins, amount)
  dp = Array.new(amount + 1) { Float::INFINITY }
  dp[0] = 0

  coins.each do |coin|
    (coin..amount).each do |i|
      dp[i] = [dp[i], dp[i - coin] + 1].min
    end
  end

  dp[amount] == Float::INFINITY ? -1 : dp[amount]
end
