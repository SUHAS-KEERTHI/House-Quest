class CreateSearches < ActiveRecord::Migration[5.1]
  def change
    create_table :searches do |t|
      t.string :keywords
      t.string :location
      t.decimal :min_price
      t.decimal :max_price
      t.decimal :min_squarefoot
      t.decimal :max_squarefoot

      t.timestamps
    end
  end
end
