# frozen_string_literal:true

# this is application helper
module UserHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    link_to title, sort: column, direction: direction, class: 'nav-item'
  end
end
