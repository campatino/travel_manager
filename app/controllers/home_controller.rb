class HomeController < ApplicationController

  before_action :authenticate_user!

  def index
    @routes = Route.get_active
  end
end
