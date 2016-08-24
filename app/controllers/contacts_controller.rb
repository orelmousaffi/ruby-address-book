#Require the script of common functions
require "common_functions"

class ContactsController < ApplicationController
  #Set a before action to reduce code redundency
  before_action :find_contact, only: [:show, :edit, :update, :destroy]

  #Index page
  #Retrieve all contacts in descending order
  def index
    @contacts = Contact.all.order("created_at DESC")
  end

  #New Contact route
  #Create an empty Contact for the form to use
  def new
    @contact = Contact.new
  end

  #New Contact page (POST)
  def create
    #Create a new contact based on the contact form fields
    @contact = Contact.new(contact_params)

    #Try to save the new Contact
    if @contact.save
      #Go to the newly created contact if successful
      redirect_to @contact
    else
      #Redirect to the create contact form if not successful
      render 'new'
    end
  end

  #Update the Contact submitted (PUT/PATCH)
  def update
    #Check if updating Contact with form paramters is successful
    if @contact.update(contact_params)
      #Go to the Contact updated
      redirect_to @contact
    else
      #Go back to edit screen if something went wrong
      render 'edit'
    end
  end

  #Delete the Contact record (DELETE)
  def destroy
    #Delete from database and redited back home
    @contact.destroy
    redirect_to root_path
  end

  #Show Contact selected
  def show
    #Find the address tied to the current contact
    @address = Address.find_by(contact_id: params[:id])

    #Return empty object if no Address was found
    if !@address
      @address = Address.new
    end
  end

  def edit
  end

  #Define private functions
  private

  #Control form paramters
  def contact_params
    #List the permitted fields being added to a Contact record
    params.require(:contact).permit(
      :fname,
      :lname,
      :phone
    )
  end
end
