class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except:[:index,:show]

  def index
    @categories = Category.all
    @test = Category.includes(:softwares).find(1)
    @test2 = Category.where(ancestry: 1)
    #@test3 = Category.includes(:softwares).where(ancestry: 1)
  end

  def show
    @secteurs = Software.joins(:categories).where(categories: { ancestry: "55" }).order("published_at desc").distinct
    @collaboration = Software.joins(:categories).where(categories: { ancestry: "1" }).order("published_at desc").distinct
    @finances = Software.joins(:categories).where(categories: { ancestry: "9" }).order("published_at desc").distinct
    @commerce = Software.joins(:categories).where(categories: { ancestry: "19" }).order("published_at desc").distinct
    @internet = Software.joins(:categories).where(categories: { ancestry: "28" }).order("published_at desc").distinct
    @marketing = Software.joins(:categories).where(categories: { ancestry: "36" }).order("published_at desc").distinct
    @rh = Software.joins(:categories).where(categories: { ancestry: "43" }).order("published_at desc").distinct
    @client = Software.joins(:categories).where(categories: { ancestry: "50" }).order("published_at desc").distinct
  end
  
  def new
    @category = Category.new
    @categories = Category.all
  end

  def edit
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_category
      @category = Category.friendly.find(params[:id])
      redirect_to action: action_name, id: @category.friendly_id, status: 301 unless @category.friendly_id == params[:id]
      #@category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :parent_id)
    end
end
