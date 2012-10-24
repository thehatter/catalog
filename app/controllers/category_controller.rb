class CategoryController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :create, :destroy, :edit , :update]
  before_filter :is_admin?, :only => [:destroy, :edit , :update, :index]

  def index
    @category = Category.all
  end

end
