class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  # respond_to :html, :json
  # GET /products
  # GET /products.json
  def index
    respond_to do |format|
      format.html
      format.json do
        render json: ProductDatatable.new(view_context)
      end
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @products = Product.all
    @product = Product.create(product_params)

=begin
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @products = Product.all
    @product = Product.find(params[:id])

    @product.update_attributes(product_params)
=begin
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  def delete
    @product = Product.find(params[:product_id])
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @products = Product.all
    @product = Product.find(params[:id])
    @product.destroy
=begin
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
=end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.

    def product_params
      params.require(:product).permit(:description, :product_subgroup_id, :cost_price, :sale_price)
    end
end
