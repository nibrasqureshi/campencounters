# frozen_string_literal:true

# Application controller for API
class Api::ApplicationController < ActionController::API
  include Authorization
  before_action :set_cache_headers
  before_action :set_default_format

  protected

  def set_default_format
    request.format = :json
  end

  private

  def set_cache_headers
    response.headers['Cache-Control'] = 'no-cache, no-store'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = '0'
  end
end
