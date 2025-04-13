def can_attend_meetings(intervals)
  intervals.sort! { |a, b| a[0] <=> b[0] }
  intervals.each_with_index do |interval, i|
    return false if i < intervals.size - 1 && intervals[i + 1][0] < interval[1]
  end

  true
end

p can_attend_meetings([[0, 30], [15, 20], [5, 10]])
p can_attend_meetings([[7, 10], [2, 4]])