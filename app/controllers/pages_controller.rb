class PagesController < ApplicationController
  api :GET, '/home'
  def home
  end

  api :GET, '/about'
  def about
  end
end
