class CreateHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.string :location
      t.integer :squareft
      t.integer :yearbuilt
      t.string :style
      t.integer :listprice
      t.integer :floors
      t.boolean :basement
      t.string :currentowner
      t.string :realtorcontact
      t.string :potentialbuyers
      t.references :companies, foreign_key: true

      t.timestamps
    end
  end
end
