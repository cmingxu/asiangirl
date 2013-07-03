class Admin::CategoriesController < Admin::BaseController

  def index
    @categories = Category.page params[:page]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
  
    respond_to do |wants|
      if @category.save
        flash[:notice] = 'Category was successfully created.'
        wants.html { redirect_to(admin_categories_path) }
        wants.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @category = Category.find params[:id]
  end
end
