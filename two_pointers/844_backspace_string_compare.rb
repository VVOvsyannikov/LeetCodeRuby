# frozen_string_literal: true

def backspace_compare(s, t)
  sp = s.size - 1
  tp = t.size - 1
  skip_s = 0
  skip_t = 0

  while sp >= 0 || tp >= 0
    while s[sp] == '#' || skip_s.positive?
      break if sp.negative?

      s[sp] == '#' ? skip_s += 1 : skip_s -= 1
      sp -= 1
    end

    while t[tp] == '#' || skip_t.positive?
      break if tp.negative?

      t[tp] == '#' ? skip_t += 1 : skip_t -= 1
      tp -= 1
    end

    return false if s[sp] != t[tp] && sp >= 0 && tp >= 0

    sp -= 1
    tp -= 1
  end

  sp == tp
end
