class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :validatable
	include DeviseTokenAuth::Concerns::User

	has_many :user_relationships
  # FIXME: has_manyがちゃんと動いていない
	has_many :followings, through: :user_relationships, source: :follow
	has_many :reverse_of_user_relationships, class_name: 'UserRelationship', foreign_key: 'follow_id'
	has_many :followers, through: :reverse_of_user_relationships, source: :user

	has_many :memos
	has_many :comments
	has_many :stocks
	has_many :likes

  # FIXME: has_manyがちゃんと動いていない、このメソッドも何故か動かない
  # def followings
  #   user.user_relationships.users
  # end

	def follow(other_user)
		return if self == other_user

		user_relationships.find_or_create_by!(follow_id: other_user.id)
	end

	def unfollow(other_user)
		return if self == other_user

		relation = user_relationships.find_by(follow_id: other_user.id)
		relation&.destroy!
	end

	def followings?(other_user)
		followings.include? other_user
	end

	def followers?(other_user)
		followers.include? other_user
	end
end

# TODO add validations such as uniqueness for email
