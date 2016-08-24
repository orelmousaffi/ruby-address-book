#Find a Contact using a URL id parameter
def find_contact

  #Check if the URL parameter is valid
  if params.has_key?(:id) && params[:id].to_i > 0
    #Find the contact based on Contact id passed
    @contact = Contact.find(params[:id])
  else
    #Redirect home on failure
    redirect_to root_path
  end
end
