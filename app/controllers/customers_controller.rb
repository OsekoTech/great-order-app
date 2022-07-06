class CustomersController < ApplicationController
  before_action :set_customer, only: %i[ show edit update ]

  # GET /customers or /customers.json
  def index
    @customers = Customer.all

    # filter by ID
    @customers = Customer.where("id = #{params[:id]}") if params[:id]
    # filter by description (nome)
    @customers = Customer.where("description = #{params[:description]}") if params[:description]
    # filter by fantasy_name
    @customers = Customer.where("fantasy_name = #{params[:fantasy_name]}") if params[:fantasy_name]
  end

  # GET /customers/1 or /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
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

  # PATH/PUT /customers/1 or /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customer_url(@customer), notice: "O cliente foi atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.require(:customer).permit(:description, :fantasy_name, :document, :another_document, :zip_code,
      :address, :number, :district, :complement, :phone, :email, :birth_date, :city, :state)
  end


=begin
  - ENTITY'S FIELDS CUSTOMER
  --------------------------
  :description
  :fantasy_name
  :document
  :another_document
  :zip_code
  :address
  :number
  :district
  :complement
  :phone
  :email
  :birth_date
  :city
  :state

  description fantasy_name document another_document zip_code address number district complement phone email birth_date:date city state

=end


end