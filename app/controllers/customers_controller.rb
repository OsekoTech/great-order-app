class CustomersController < ApplicationController

  # Get /customers/new
  def new
    @customer = Customer.new
  end

  # POST /customers or  /customers.json
  def create
    @customer = Customer.new(customer_params)
    respond_to do |format|
      if @customer.save
        format.html { redirect_to customer_url(@customer), notice: "O cliente foi registrado com sucesso!" }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:description, :fantasy_name, :document, :another_document, :zip_code,
      :address, :number, :district, :complement, :phone, :email, :birth_date, :city, :state)
  end

end