class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :description
      t.string :fantasy_name
      t.string :document
      t.string :another_document
      t.string :zip_code
      t.string :address
      t.string :number
      t.string :district
      t.string :complement
      t.string :phone
      t.string :email
      t.date :birth_date
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
