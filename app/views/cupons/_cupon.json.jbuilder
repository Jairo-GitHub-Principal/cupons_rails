json.extract! cupon, :id, :description, :url_image, :code_id, :created_at, :updated_at
json.url cupon_url(cupon, format: :json)
