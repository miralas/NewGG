class CreateCompanyVacancies < ActiveRecord::Migration
  def change
    create_table :company_vacancies do |t|
      t.references :company, index: true, foreign_key: true
      t.string :title
      t.float :salary
      t.text :requirements
      t.text :description

      t.timestamps null: false
    end
  end
end
