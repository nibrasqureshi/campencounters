# frozen_string_literal:true

json.camps do |json|
  json.array! @camps do |camp|
    json.id camp.id
    json.title camp.camp_title
  end
end
