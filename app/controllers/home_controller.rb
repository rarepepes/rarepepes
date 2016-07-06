class HomeController < ApplicationController
  def index
    @pepes = Pepe.all.order(created_at: :desc)
  end
end
