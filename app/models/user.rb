class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_and_belongs_to_many :creator_genres
  has_many :favorites,  dependent: :destroy
  has_many :comments,   dependent: :destroy
  has_many :follower,         class_name: "Relationship",
                              foreign_key: :follower_id,
                              dependent: :destroy

  has_many :followed,         class_name: "Relationship",
                              foreign_key: :followed_id,
                              dependent: :destroy
                              
  has_many :follower_user,    through: :followed,
                              source: :follower # 自分をフォローしている人

  has_many :following_user,   through: :follower,
                              source: :followed # 自分がフォローしている人
  has_many :save_items, dependent: :destroy
  has_many :work_rooms, dependent: :destroy

  validates :name,
    presence: true,
    length: { minimum: 1, maximum:30 }
end
