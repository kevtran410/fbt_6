class ToursController < ApplicationController
  load_resource

  def show
    @reviews = @tour.reviews.all
  end
end
