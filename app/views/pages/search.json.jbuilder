json.softwares do
  json.array!(@softwares) do |software|
    json.title software.title
    json.slogan software.slogan
    json.category software.category_ids
    json.logo_url url_for(software.logo)
    json.url software_path(software)
  end
end

json.categories do
  json.array!(@categories) do |category|
    json.name category.name
    json.url category_path(category)
  end
end