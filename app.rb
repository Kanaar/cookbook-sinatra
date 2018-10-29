require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

require 'csv'
require_relative 'lib/recipe.rb'
require_relative 'lib/cookbook.rb'


configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/' do
  @cookbook = Cookbook.new('lib/recipes.csv')
  @recipes = @cookbook.all
  erb :index
end

get '/new_recipe' do
  @recipe = Recipe.new({name: @name, description: @description, prep_time: @prep_time, dificulty: @dificulty})
  erb :new_recipe
end

post "/new_recipe" do
  @cookbook.add_recipe(@recipe)
  "OK"
end
