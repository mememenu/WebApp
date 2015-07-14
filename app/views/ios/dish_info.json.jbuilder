json.array!(@active_dishes) do |dish|
  json.id dish.id
  json.name dish.name
  json.category_id dish.category_id
  json.menu_id dish.menu_id
  json.description dish.description
  json.avatar dish.default_image.try(:avatar)
  json.cloud_front dish.default_image.try(:cloudfront_url)
end
