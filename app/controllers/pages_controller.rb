class PagesController < ApplicationController
  def home
    redirect_to about_path, notice: "This is an alert"
  end

  def about
  end
end
