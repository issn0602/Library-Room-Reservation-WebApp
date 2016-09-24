json.array!(@rooms) do |room|
  json.extract! room, :id, :building, :number, :size
  json.url room_url(room, format: :json)
end
