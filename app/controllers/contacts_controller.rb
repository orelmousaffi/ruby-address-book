class ContactsController < ApplicationController
  before_action :find_contact, only: [:show, :edit, :update, :destroy]

  def index
    @contacts = Contact.all.order("created_at DESC")
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to @contact  
    else
      render 'new'
    end
  end

  def update
    if @contact.update(contact_params)
      redirect_to @contact
    else
      render 'edit'
    end
  end

  def destroy
    @contact.destroy
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  private

  def find_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(
      :fname,
      :lname,
      :phone
    )
  end

  def address_params
    params.require(:address).permit(
      :street_name,
      :city,
      :province,
      :postal_code
    )
  end
end
