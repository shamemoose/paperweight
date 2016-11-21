class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  has_secure_password

	has_many :publications
	has_many :active_relationships, class_name:  "Relationship",
																	foreign_key: "follower_id",
																	dependent:   :destroy

	has_many :passive_relationships, class_name:  "Relationship",
																	 foreign_key: "followed_id",
																	 dependent:   :destroy
	has_many :following, through: :active_relationships, source: :followed
	has_many :followers, through: :passive_relationships, source: :follower

  validates :name, presence: true
  validates :email, presence: true, length: { maximum: 255 },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }


  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end
end
