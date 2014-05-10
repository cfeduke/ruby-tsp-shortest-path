#!/usr/bin/env ruby

require "ai4r/genetic_algorithm/genetic_algorithm"
require "csv"

POPULATION_SIZE=800
GENERATIONS=100

csv_path = File.join(File.dirname(__FILE__), "data.csv")
data_set = CSV.read(csv_path)
labels = data_set.shift
data_set.map! do |column|
  column.map { |e| e.to_f }
end

Ai4r::GeneticAlgorithm::Chromosome.set_cost_matrix(data_set)

puts "Starting genetic search; population size: #{POPULATION_SIZE} with #{GENERATIONS} generations..."
search = Ai4r::GeneticAlgorithm::GeneticSearch.new(POPULATION_SIZE, GENERATIONS)
result = search.run
puts "Result cost: #{result.fitness}"
puts "Routes:"
result.data.each { |c| print " #{labels[c]}" }
