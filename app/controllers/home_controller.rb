class HomeController < ApplicationController
  include RedirectIfRequestedConcern

  def show
    render plain: 'Home controller, show method'
  end
end
