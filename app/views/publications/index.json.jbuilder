json.array!(@publications) do |publication|
  json.extract! publication, :id, :title, :description, :publication_date, :user_id
  json.url publication_url(publication, format: :json)
end
