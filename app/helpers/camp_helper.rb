# frozen_string_literal:true

# this is application helper
module CampHelper
  def locations
    JSON.parse(locations)
  end
end
