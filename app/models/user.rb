class User < ApplicationRecord
  belongs_to :company
  has_many :inquiries
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable
         
  validates :name, presence: true
  validates :phone, numericality: { only_integer: true }, length: { in: 8..10}, allow_blank: true
  
  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first
    
    if user
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name   
        user.uid = auth.uid
        user.provider = auth.provider
        user.role_type = 'Househunter'
      end
    end
  end
end
