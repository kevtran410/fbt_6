class StaticPagesController < ApplicationController
  def show
    @tours = Tour.newest_tours
    if valid_page_name?
      if valid_page_name?
        render template: "static_pages/#{params[:page_name]}"
      else
        render file: "public/404.html"
      end
    end
  end

  private
  def valid_page_name?
    File.exist? Pathname.new(
      Rails.root + "app/views/static_pages/#{params[:page_name]}.html.erb")
  end
end
