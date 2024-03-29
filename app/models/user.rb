class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :jwt_authenticatable, :registerable, :recoverable, :rememberable, :validatable,
         :confirmable, jwt_revocation_strategy: JwtDenylist
  has_many :posts, foreign_key: :author_id, dependent: :destroy
  has_many :comments, foreign_key: :author_id, dependent: :destroy
  has_many :likes, foreign_key: :author_id, dependent: :destroy

  validates :name, presence: true, length: { in: 3..15 }
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }

  # ROLES = %w[admin default].freeze
  def admin?
    role == 'admin'
  end

  def recent_posts
    posts.includes(:author).limit(3).order(created_at: :desc)
  end
end
