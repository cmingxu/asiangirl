class Admin::ResourcesController < Admin::BaseController

  def index
    @resources = scope.page params[:page]
  end

  def new
  end

  def edit
  end

  def scope
    @gallery = Gallery.find_by_id params[:gallery_id]
    @gallery.try(:resources) || Resource
  end
end
