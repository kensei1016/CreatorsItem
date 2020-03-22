class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image

  has_and_belongs_to_many :creator_genres
  has_many :favorites,  dependent: :destroy
  has_many :comments,   dependent: :destroy
  has_many :follower,         class_name: "Relationship",
                              foreign_key: :follower_id,
                              dependent: :destroy
  has_many :followed,         class_name: "Relationship",
                              foreign_key: :followed_id,
                              dependent: :destroy
  # 自分のフォロワー
  has_many :follower_user,    through: :followed,
                              source: :follower
  # 自分がフォローしている人
  has_many :following_user,   through: :follower,
                              source: :followed
  has_many :save_items, dependent: :destroy
  has_many :work_rooms, dependent: :destroy

  validates :name,
    presence: true,
    length: { minimum: 1, maximum:30 }

  # 自分の投稿がいいねされた回数
  def post_favorite_count
    work_room_ids = work_rooms.map{|work_room| work_room.id }
    Favorite.where(work_room_id: work_room_ids).count
  end

  def follow(user_id)
    follower.create(followed_id: user_id)
  end

  def unfollow(user_id)
    follower.find_by(followed_id: user_id.to_i ).destroy
  end

  def following?(user)
    following_user.include?(user)
  end
end
