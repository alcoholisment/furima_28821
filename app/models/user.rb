class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         regEx = /\A[ぁ-んァ-ン一-龥]/
         regEx1 = /\A[ァ-ヶー－]+\z/

  validates :name, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  with_options presence: true, format: { with: /#{regEx}/ } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /#{regEx}/ } do
    validates :first_name_kana
    validates :last_name_kana
  end
end
