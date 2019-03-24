class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :website, presence: true, format: { with: /\A(http[s]?:\/\/)?([w]{3}[.])?[\w]+.[\w]+\z/ }
  validates :address, presence: true
  validates :year, allow_blank: true, numericality: { only_integer: true }, length: { is: 4 }
  validates :revenue, allow_blank: true, numericality: { only_integer: true }
  validates :synopsis, presence: true, allow_blank: true
  
  has_many :user, foreign_key: true
  
end
