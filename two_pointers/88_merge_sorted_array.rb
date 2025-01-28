# frozen_string_literal: true

def merge(nums1, m, nums2, n)
  p_nums1 = n - 1
  p_nums2 = n - 1
  m.times do |i|
    if p_nums1 >= 0 && p_nums2 >= 0
      if nums1[p_nums1] >= nums2[p_nums2]
        nums1[-i - 1] = nums1[p_nums1]
        p_nums1 -= 1
      else
        nums1[-i - 1] = nums2[p_nums2]
        p_nums2 -= 1
      end
    elsif p_nums1 >= 0 && p_nums2.negative?
      nums1[-i - 1] = nums1[p_nums1]
      p_nums1 -= 1
    else
      nums1[-i - 1] = nums2[p_nums2]
      p_nums2 -= 1
    end
  end
end
