class AddSpecializationToCompany < ActiveRecord::Migration
  def change
    add_column :companies, :specialization, :string
  end
end
