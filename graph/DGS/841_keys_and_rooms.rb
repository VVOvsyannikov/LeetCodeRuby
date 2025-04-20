# frozen_string_literal: true

def can_visit_all_rooms(rooms)
  seen = {}
  seen[0] = 1
  stack = [0]

  while stack.size.positive?
    room = stack.pop

    rooms[room].each do |key|
      if key && !seen[key]
        seen[key] = 1
        stack << key
      end
    end
  end

  seen.size == rooms.size
end
