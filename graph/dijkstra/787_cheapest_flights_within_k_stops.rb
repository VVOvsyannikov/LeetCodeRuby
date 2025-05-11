# frozen_string_literal: true

def find_cheapest_price(_n, flights, src, dst, k)
  graph = Hash.new { |h, k| h[k] = [] }
  destinations = Set.new

  flights.each do |from, to, price|
    graph[from] << [price, to]
    destinations.add(to)
  end

  return -1 unless destinations.include? dst

  heap = Containers::MinHeap.new
  heap.push([0, src, 0])
  routes = {}
  routes[src] = 0

  until heap.empty?
    price, city, steps = heap.pop

    next if steps > k + 1

    return price if city == dst

    graph[city].each do |price_to, to|
      next if routes[to] && routes[to] <= price + price_to && steps - 1 >= k

      heap.push([price + price_to, to, steps + 1])
      routes[to] = price + price_to
    end
  end

  -1
end
