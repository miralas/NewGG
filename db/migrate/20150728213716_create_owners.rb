class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :company_id

      t.timestamps null: false
    end
  end
end
