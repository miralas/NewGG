class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :company_type
      t.string :company_name
      t.text :about
      t.string :website
      t.references :user, index: true, foreign_key: true
      t.string :photo
      t.boolean :is_payed

      t.timestamps null: false
    end
  end
end
