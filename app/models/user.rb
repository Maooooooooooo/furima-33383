class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true 
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password,format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
  with_options presence: true,format: { with: /\A[ァ-ヶー-]+\z/ } do
    validates :first_name_kana
    validates :last_name_kana
  end
  validates :birth_day, presence: true
end