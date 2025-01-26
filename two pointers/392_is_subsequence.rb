# frozen_string_literal: true

def is_subsequence(s, t)
  pointer = 0

  t.size.times do |i|
    pointer += 1 if s[pointer].eql?(t[i])
  end

  pointer.eql?(s.size)
end
