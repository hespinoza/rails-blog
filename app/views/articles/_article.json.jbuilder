json.extract! article, :id, :name, :cover, :body, :created_at, :updated_at
json.url article_url(article, format: :json)