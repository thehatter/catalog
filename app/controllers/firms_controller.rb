class FirmsController < ApplicationController
  
  def index
    @firms = Firm.all
  end

  def new
    @firm = Firm.new
  end
end
