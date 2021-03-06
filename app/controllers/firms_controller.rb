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
    #@phones = @firm.phones
    @addresses = @firm.addresses
    @galleries = @firm.galleries
  end

  def new
    @firm = Firm.new
    #3.times { @firm.phones.build}
    @categories = ancestry_options(Category.at_depth(1).scoped.arrange(:order => 'name')) {|i| "#{'-' * i.depth} #{i.name}" }
  end

  def edit
    @categories = ancestry_options(Category.scoped.arrange(:order => 'name')) {|i| "#{'-' * i.depth} #{i.name}" }
    #3.times { @firm.phones.build}
  end

  def create
    @firm = current_user.firms.build(params[:firm])
    @categories = ancestry_options(Category.at_depth(1).scoped.arrange(:order => 'name')) {|i| "#{'-' * i.depth} #{i.name}" }

    if @firm.save
      flash[:success] = "Firm created!"
      redirect_to root_url
    else
      flash[:error] = "Firm NOT CREATED!"
      render 'new'
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
