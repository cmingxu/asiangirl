class WelcomeController < ApplicationController
  def index
    @galleries = Gallery.page(params[:page]).per(20)
  end

  def dashboard
  end

  def about
    @page = Page.find_by_slug "about"
  end

  def team
  end

  def load_more
    @galleries = Gallery.offset( params[:last]).limit(20)
    render :partial => "galleries", :layout => false, :locals => {:galleries => @galleries }
  end
end
