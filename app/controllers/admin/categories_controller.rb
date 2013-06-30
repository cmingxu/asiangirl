class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.page params[:page]
  end

  def new
  end

  def edit
  end
end
