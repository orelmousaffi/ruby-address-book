#Require the script of common functions
require "common_functions"

class AddressesController < ApplicationController
  #Set a before action to reduce code redundency
  before_action :find_all, only: [:edit, :update, :destroy]
  before_action :find_contact, only: [:new, :create]

  #Address Index page
  def index
    #The User is redirected to the contacts listing
    #A contact must be selected to interact with Address info
    redirect_to "/contacts"
  end

  #New Address route
  def new
    #Create an empty Address for the form to use
    @address = Address.new
  end

  #Create Address page (POST)
  def create
    #Create an Address using the form parameters permitted
    @address = Address.new(address_params)
    #Set the newly created address to reference the correct Contact
    @address.contact_id = params[:id]

    #Check if the Address insert was successful
    if @address.save
      #Redirect to the referenced contact to see changes
      redirect_to @contact
    end
  end

  #Update address details (PUT/PATCH)
  def update
    #Try and update the record using form posts
    if @address.update(address_params)
      #Show referenced contact with updated address info upon success
      redirect_to @contact
    else
      #Go back to edit page if failure occurred
      render 'edit'
    end
  end

  #Delete Address record (DELETE)
  def destroy
    #Delete the address and redirect to referenced contact
    @address.destroy
    redirect_to @contact
  end

  def edit
  end

  #Define private functions
  private

  #Private function for multiple controllers
  def find_all
    #Find the contact and address based on URL id
    @contact = Contact.find(params[:id])
    @address = Address.find_by(contact_id: params[:id])
  end

  #Control form paramters
  def address_params
    #List the permitted fields being added to a Address record
    params.require(:address).permit(
      :street_name,
      :city,
      :province,
      :postal_code
    )
  end
end
