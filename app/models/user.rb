class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # TODO add validations such as uniqueness for email

  has_many :user_relationships
  has_many :followers, through: :user_relationships, source: :follower
  has_many :reverse_of_user_relationships, class_name: 'UserRelationship', foreign_key: 'follower_id'
  has_many :followings, through: :reverse_of_user_relationships, source: :user

  # dependent: :destroyは一旦書かないでおく。何故ならばユーザーが退会したらいいね数が減る、コメントが消えるのは問題だから。
  has_many :memos
  has_many :comments
  has_many :stocks
  has_many :likes
end
