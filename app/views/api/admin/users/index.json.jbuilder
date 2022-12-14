# frozen_string_literal:true

json.users do |json|
  json.array! @users do |user|
    json.id user.id
    json.first_name user.first_name
    json.last_name user.last_name
  end
end
