# frozen_string_literal:true

# this is application helper
module ApplicationHelper
  def check_data_presence(data)
    data || '_'
  end
end
