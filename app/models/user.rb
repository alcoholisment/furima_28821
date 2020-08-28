class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  regex1 = /\A[ぁ-んァ-ン一-龥]/
  regex2 = /\A[ァ-ヶー－]+\z/

  validates :name, presence: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }

  with_options presence: true, format: { with: /#{regex1}/ } do
    validates :first_name
    validates :last_name
  end

  with_options presence: true, format: { with: /#{regex2}/ } do
    validates :first_name_kana
    validates :last_name_kana
  end
  validates :birthday, presence: true
end
