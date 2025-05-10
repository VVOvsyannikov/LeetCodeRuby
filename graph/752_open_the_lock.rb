# frozen_string_literal: true

def open_lock(deadends, target)
  return -1 if deadends.include?('0000')

  seen = Set.new
  deadends.each do |d|
    seen.add(d)
  end

  queue = [['0000', 0]]
  seen.add('0000')

  while queue.size.positive?
    number, steps = queue.pop
    return steps if number == target

    next_combinations(number).each do |combination|
      next if seen.include?(combination)

      queue.unshift([combination, steps + 1])
      seen.add(combination)
    end
  end

  -1
end

def next_combinations(combination)
  result = []
  combination.size.times do |i|
    digit = combination[i].to_i
    [1, -1].each do |val|
      next_digit = (digit + val) % 10
      result << "#{combination[...i]}#{next_digit}#{combination[(i + 1)...]}"
    end
  end

  result
end
