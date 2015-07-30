class CreateCompanyNews < ActiveRecord::Migration
  def change
    create_table :company_news do |t|
      t.references :company, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.text :body
      t.boolean :published

      t.timestamps null: false
    end
  end
end
