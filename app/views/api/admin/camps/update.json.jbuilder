# frozen_string_literal:true

json.camp do
  json.id @camp.id
  json.title @camp.camp_title
  json.body @camp.camp_type
end
