class CreateInquiries < ActiveRecord::Migration[5.1]
  def change
    create_table :inquiries do |t|
      t.references :user, foreign_key: true
      t.string :subject
      t.string :message

      t.timestamps
    end
  end
end
