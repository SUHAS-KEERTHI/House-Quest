class AddReplyToInquiry < ActiveRecord::Migration[5.1]
  def change
    add_column :inquiries, :reply, :string
  end
end
