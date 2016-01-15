json.array!(@monsters) do |monster|
  json.extract! monster, :id, :name, :power, :category, :user_id, :team_id
  json.url monster_url(monster, format: :json)
end
