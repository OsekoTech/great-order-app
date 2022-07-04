require 'rails_helper'

RSpec.describe Customer, type: :model do
  context "CRUD Customer" do

    it 'Create Customer' do
      customer_type = Customer.create(description: "SERGIO OSEKO", phone: "18981016963")
      expect(customer_type.description).to eq("SERGIO OSEKO")
      expect(customer_type.phone).to eq("18981016963")
    end

    it 'Create Customer' do
      customer_type = Customer.create(
        description: "GUMERCINDO CORDEIRO DA SILVA",
        fantasy_name: "GU",
        document: "12345678900",
        another_document: "123456789",
        zip_code: "12345678",
        address: "SAN FRANCISCO AVENUE",
        number: "123A",
        district: "BLACK ISLAND",
        complement: nil,
        phone: "18981016963",
        email: "gumercindo@gmail.com",
        birth_date: 11/05/1980,
        city: "BIRIGUI",
        state: "SP")
      expect(customer_type.description).to eq("GUMERCINDO CORDEIRO DA SILVA")
      expect(customer_type.fantasy_name).to eq("GU")
      expect(customer_type.document).to eq("12345678900")
      expect(customer_type.another_document).to eq("123456789")
      expect(customer_type.zip_code).to eq("12345678")
      expect(customer_type.address).to eq("SAN FRANCISCO AVENUE")
      expect(customer_type.number).to eq("123A")
      expect(customer_type.district).to eq("BLACK ISLAND")
      expect(customer_type.complement).to eq(nil)
      expect(customer_type.phone).to eq("18981016963")
      expect(customer_type.email).to eq("gumercindo@gmail.com")
      expect(customer_type.birth_date).to eq(11/05/1980)
      expect(customer_type.city).to eq("BIRIGUI")
      expect(customer_type.state).to eq("SP")
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

    it 'Update Customer' do
      customer_type = Customer.create(
        description: "John White",
        fantasy_name: "John",
        document: "12345678900",
        another_document: "123456789",
        zip_code: "12345678",
        address: "Ten Street",
        number: "123A",
        district: "Red Island",
        complement: nil,
        phone: "18981016963",
        email: "gumercindo@gmail.com",
        birth_date: 11/05/1980,
        city: "New York City",
        state: "NY")

      customer_type.update(phone: "99999999999", email: "white.john@gmail.com")

      expect(customer_type.phone).to eq("99999999999")
      expect(customer_type.email).to eq("white.john@gmail.com")
    end

  end
end
