# frozen_string_literal: true

def min_mutation(start_gene, end_gene, bank)
  return 0 if start_gene == end_gene
  return -1 if bank.empty? || !bank.include?(end_gene)

  mutations = 0
  queue = [[start_gene, mutations]]
  seen = Set.new
  seen.add(start_gene)

  until queue.empty?
    gene, mutations = queue.pop

    return mutations if gene == end_gene

    next_genes(gene).each do |combination|
      next if seen.include?(combination) || !bank.include?(combination)

      queue.unshift([combination, mutations + 1])
      seen.add(combination)
    end
  end

  -1
end

def next_genes(gene)
  result = []
  gene.size.times do |i|
    %w[A T G C].each do |nucl|
      next if gene[i] == nucl

      result << "#{gene[...i]}#{nucl}#{gene[(i + 1)...]}"
    end
  end

  result
end
