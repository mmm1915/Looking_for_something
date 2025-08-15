class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :search_posts, dependent: :destroy

  validates :nickname, presence: true, uniqueness: true

  def self.ransackable_attributes(auth_object = nil)
    %w[ nickname ]
  end
end
