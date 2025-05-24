# frozen_string_literal: true

def num_decodings(s)
  cache = {}

  inner = lambda do |num|
    return cache[num] if cache.key?(num)
    return 1 if num.empty?
    return 0 if num.start_with?('0')
    return 1 if num.size == 1

    cache[num] = if num[0..1] > '26'
                   inner.call(num[1..])
                 else
                   inner.call(num[1..]) + inner.call(num[2..])
                 end
    cache[num]
  end

  inner.call(s)
end
