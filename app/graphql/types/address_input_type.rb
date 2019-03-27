module Types
  class AddressInputType < Types::BaseInputObject
    argument :country, String, required: false
    argument :full_name, String, required: false
    argument :street1,String, required: false
    argument :street2, String, required: true
    argument :city, String,  required: false
    argument :zip, String required: false
    argument :phone, String, required: false
    argument :security_code, String, required: true
    argument :instructions, String, required: true
  end
end