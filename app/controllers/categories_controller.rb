class CategoriesController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :destroy, :edit , :update]
  before_filter :is_admin?, :only => [:destroy, :edit , :update]
  before_filter :category, :only => [:show, :edit, :update, :destroy]

  def index
    @categories = Category.scoped
  end


  def show
    # @firms = Firm.all
    @firms = @category.firms
  end


  def new
    @category = Category.new(:parent_id => params[:parent_id])
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:success] = "Category created!"
      redirect_to root_url
    else
      flash[:error] = "Category NOT created!"
      redirect_to root_url
    end
  end

private
  def category
    @category ||= Category.find_by_slug!(params[:id])
  end
  helper_method :category
  
end
