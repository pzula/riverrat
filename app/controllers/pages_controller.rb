class PagesController < ApplicationController
  def home
    @rivers = River.all
  end
end
