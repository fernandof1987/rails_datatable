class ProductSubgroupsController < ApplicationController
  before_action :set_product_subgroup, only: [:show, :edit, :update, :destroy]

  # GET /product_subgroups
  # GET /product_subgroups.json
  def index
    @product_subgroups = ProductSubgroup.all
  end

  # GET /product_subgroups/1
  # GET /product_subgroups/1.json
  def show
  end

  # GET /product_subgroups/new
  def new
    @product_subgroup = ProductSubgroup.new
  end

  # GET /product_subgroups/1/edit
  def edit
  end

  # POST /product_subgroups
  # POST /product_subgroups.json
  def create
    @product_subgroup = ProductSubgroup.new(product_subgroup_params)

    respond_to do |format|
      if @product_subgroup.save
        format.html { redirect_to @product_subgroup, notice: 'Product subgroup was successfully created.' }
        format.json { render :show, status: :created, location: @product_subgroup }
      else
        format.html { render :new }
        format.json { render json: @product_subgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_subgroups/1
  # PATCH/PUT /product_subgroups/1.json
  def update
    respond_to do |format|
      if @product_subgroup.update(product_subgroup_params)
        format.html { redirect_to @product_subgroup, notice: 'Product subgroup was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_subgroup }
      else
        format.html { render :edit }
        format.json { render json: @product_subgroup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_subgroups/1
  # DELETE /product_subgroups/1.json
  def destroy
    @product_subgroup.destroy
    respond_to do |format|
      format.html { redirect_to product_subgroups_url, notice: 'Product subgroup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_subgroup
      @product_subgroup = ProductSubgroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_subgroup_params
      params.require(:product_subgroup).permit(:description, :product_group_id)
    end
end
