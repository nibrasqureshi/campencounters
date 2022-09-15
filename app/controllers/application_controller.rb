# frozen_string_literal:true

# Application controller
class ApplicationController < ActionController::Base
  include Authorization

  before_action :authenticate_user!
end
