# frozen_string_literal: true

# Welcome controller
class WelcomeController < ApplicationController
  def index
    @camps = Camp.active
    @camp = Camp.new
  end
end
