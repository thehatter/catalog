class FirmsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :destroy, :edit , :update]
  before_filter :correct_user, :only => [:destroy, :edit , :update]
  before_filter :firm, :only => [:show, :edit, :update, :destroy]

  def index
    @firms = Firm.all
    # if current_user.admin?
    #   flash[:success] = "current_user is admin"
    # elsif !current_user.admin?
    #   flash[:success] = "current_user not admin"
    # else
    #   flash[:success] = "WTF"
    # end

  end

  def show
  end

  def new
    @firm = Firm.new
    @categories = ancestry_options(Category.scoped.arrange(:order => 'name')) {|i| "#{'-' * i.depth} #{i.name}" }
  end

  def edit
    @categories = ancestry_options(Category.scoped.arrange(:order => 'name')) {|i| "#{'-' * i.depth} #{i.name}" }
  end

  def create
    @firm = current_user.firms.build(params[:firm])
    if @firm.save
      flash[:success] = "Firm created!"
      redirect_to root_url
    else
      flash[:error] = "Firm NOT CREATED!"
      redirect_to root_url
    end
  end

  def update
    if @firm.update_attributes(params[:firm])
      flash[:success] = "Firm saved!"
    redirect_to root_url
    else
      flash[:error] = "Firm NOT SAVED!"
      redirect_to root_url
    end
  end


  def destroy
    @firm.destroy
    flash[:success] = "Firm deleted!"
    redirect_to root_url
  end

  private

  def correct_user
    @firm = current_user.firms.find_by_slug(params[:id])
    @firm = Firm.find_by_slug(params[:id]) if current_user.admin? 
    
    if @firm.nil?
      redirect_to root_url
      flash[:error] = "current_user is not fk admin!" if !current_user.admin?
    end
  end

  def ancestry_options(items, &block)
    return ancestry_options(items){ |i| "#{'-' * i.depth} #{i.name}" } unless block_given?

    result = []
    items.map do |item, sub_items|
      result << [yield(item), item.id]
      #this is a recursive call:
      result += ancestry_options(sub_items, &block)
    end
    result
  end


# !!!!!!!!!!!!!!

  def firm
    @firm ||= Firm.find_by_slug!(params[:id].split("/").last)
  end
  
  helper_method :firm

end
