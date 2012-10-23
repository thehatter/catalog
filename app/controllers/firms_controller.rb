class FirmsController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :destroy, :edit , :update]
  before_filter :correct_user, :only => [:destroy, :edit , :update]

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
    @firm = Firm.find(params[:id])
  end

  def new
    @firm = Firm.new
  end

  def edit
    @firm = Firm.find(params[:id])
  end

  def create
    @firm = current_user.firms.build(params[:firm])
    if @firm.save
      flash[:success] = "Firm created!"
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def update
    @firm = Firm.find(params[:id])

      if @firm.update_attributes(params[:firm])
        flash[:success] = "Firm saved!"
      redirect_to root_url
      else
        flash[:success] = "Firm NOT SAVED!"
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
      @firm = current_user.firms.find_by_id(params[:id])
      @firm = Firm.find_by_id(params[:id]) if current_user.admin? 
      
      redirect_to root_url if @firm.nil?
      flash[:success] = "current_user is not fk admin!" if !current_user.admin?
    end

end
