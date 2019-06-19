class AddressesController < ApplicationController

  def index 
    if Address.count > 0
      @addresses = Address.last
    else
      @addresses = Address.new
      flash[:error] = '<strong>Could not retrieve: </strong> no data has been saved.'
    end
  end 

  def new 
    @address = Address.new
  end 

  def create 
    @address = Address.create(address_params)
    if @address.invalid?
      flash[:error] = '<strong>Could not save: </strong> the data you entered is invalid.'
    else
      redirect_to addresses_path
    end
    # redirect_to root_path
  end 

  private 

  def address_params
    params.require(:address).permit(:street, :city, :state, :zip)
  end
end
