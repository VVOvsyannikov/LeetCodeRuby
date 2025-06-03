# frozen_string_literal: true

def gcd_of_strings(str1, str2)
  return '' if str1 + str2 != str2 + str1

  max_length = str1.size.gcd(str2.size)
  str1[...max_length]
end
