class Backend::ProductsController < Backend::BaseController
  before_action :find_product, only:[:edit, :update, :destroy]

  def index
    @products = Product.page(params[:page]).per(10)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to backend_products_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to backend_products_path, notice: '成功更新商品'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to backend_products_path
  end

  private
  def find_product
    @product = Product.find_by(id: params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :is_online, :image)
  end
end
