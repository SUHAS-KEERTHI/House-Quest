class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.string :website, null: false
      t.string :address, null: false
      t.string :year, null: true
      t.string :revenue, null: true
      t.string :size, null: true
      t.text :synopsis, null: true
      t.references :user

      t.timestamps null: false
    end
  end
end
