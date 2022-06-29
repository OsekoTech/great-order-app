require 'rails_helper'

RSpec.describe Customer, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  context "CRUD Customer" do

    it 'Create Customer' do
      customer_type = Customer.create(description: "SERGIO OSEKO", phone: "18981016963")
      expect(customer_type.description).to eq("SERGIO OSEKO")
      expect(customer_type.phone).to eq("18981016963")
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

    # 27/06/2022 to-do: test with all customer fields
    it 'Create Customer' do
      customer_type = Customer.create(
        description: "GUMERCINDO CORDEIRO DA SILVA",
        fantasy_name: "GU",
        document: "12345678900",
        another_document: "123456789",
        zip_code: "12345678",
        address: "San Francisco Avenue",
        number: "123A",
        district: "BLACK ISLAND",
        complement: nil,
        phone: "18981016963",
        e_mail: "gumercindo@gmail.com",
        birth_date: 11/05/1980,
        city: "BIRIGUI",
        state: "SP")
      # 29/06/2022 to-do: test with all customer fields (expect) <<
      expect(customer_type.description).to eq(nil)
      expect(customer_type.phone).to eq("18981016963")
    end

    describe 'required validations' do
      it { should validate_presence_of(:description) }
      it { should validate_presence_of(:phone) }
    end

    describe 'maximum field size' do
      it { should validate_length_of(:description).is_at_most(100) }
      it { should validate_length_of(:fantasy_name).is_at_most(50) }
      it { should validate_length_of(:state).is_at_most(2) }
      it { should validate_length_of(:city).is_at_most(60) }
      it { should validate_length_of(:district).is_at_most(60) }
      it { should validate_length_of(:complement).is_at_most(60) }
    end

  end
end
