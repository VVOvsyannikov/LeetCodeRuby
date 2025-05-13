def find_all_recipes(recipes, ingredients, supplies)
  in_degree = {}
  graph = Hash.new { |h, k| h[k] = [] }

  recipes.zip(ingredients).each do |recipe, components|
    in_degree[recipe] = components.size
    components.each { |component| graph[component] << recipe }
  end

  queue = supplies
  result = []

  until queue.empty?
    supply = queue.pop

    graph[supply].each do |recipe|
      in_degree[recipe] -= 1

      next unless in_degree[recipe].zero?

      queue.unshift(recipe)
      result << recipe
    end
  end

  result
end