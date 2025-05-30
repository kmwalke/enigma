class HomeController < ApplicationController
  def index
    @ceaser = Ceaser.first
  end
end
