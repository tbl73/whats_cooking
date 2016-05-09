json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :name, :directions, :category, :avatar, :user_id
  json.url recipe_url(recipe, format: :json)
end
