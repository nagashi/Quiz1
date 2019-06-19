class PagesController < ApplicationController
  def home
    puts ""
  end

  def index
      @address = Address.last
  end

  def show
    @address = Address.find(params[:id])
  end

  def new
    @address = Address.new
  end
 
  def create 
    @address = Address.create(address_params)
    if @address.valid?
      redirect_to root_path
    else 
      render :new, status: :unprocessable_entity
    end
  end
  

  private

  def address_params
    params.required(:address).permit(:street, :city, :state, :zip)
  end

end