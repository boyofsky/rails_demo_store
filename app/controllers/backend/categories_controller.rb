class Backend::CategoriesController < Backend::BaseController
  before_action :find_category, only:[:edit, :update, :destroy]

  def index
    @allcategories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to backend_categories_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to backend_categories_path, notice: '成功更新分類'
    else
      render :edit
    end
  end

  def destroy
      @category.destroy
      redirect_to backend_categories_path, notice: '成功刪除分類'
  end

  private
  def find_category
    @category = Category.find_by(id: params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :category_id)
  end
end
