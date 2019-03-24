class AddRealtorAndUserEmailToInquiry < ActiveRecord::Migration[5.1]
  def change
    add_column :inquiries, :user_email, :string
    add_column :inquiries, :realtor_email, :string
  end
end
