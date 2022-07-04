json.extract! customer, :id, :description, :fantasy_name, :document, :another_document, :zip_code,
  :address, :number, :district, :complement, :phone, :email, :birth_date, :city, :state, :created_at, :updated_at

json.url customer_url(customer, format: :json)
