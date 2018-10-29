require 'csv'
require_relative 'recipe.rb'

class Cookbook
  attr_reader :recipes

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = []
    CSV.foreach(@csv_file_path) do |row|
      arguments = { name: row[0], description: row[1], prep_time: row[2], status: [3], dificulty: [4] }
      @recipes << Recipe.new(arguments)
    end
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    update_csv
  end

  def change_status(index, new_status)
    @recipes[index].status = new_status
    update_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    update_csv
  end

  def update_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description, recipe.prep_time, recipe.status, recipe.dificulty]
      end
    end
  end
end
