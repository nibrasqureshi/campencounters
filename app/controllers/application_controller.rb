# frozen_string_literal:true

# Application controller
class ApplicationController < ActionController::Base
  include Authorization
  before_action :set_cache_headers

 private 

  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "0"
  end
end
