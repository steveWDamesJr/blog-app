class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :comments, foreign_key: :post_id, dependent: :destroy
  has_many :likes, foreign_key: :post_id, dependent: :destroy

  validates :title, presence: true, length: { in: 3..250 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }

  after_save :update_posts_counter

  def update_posts_counter
    author.increment!(:posts_counter)
  end

  def recent_comments
    comments.includes(:author).limit(5).order(created_at: :DESC)
  end
end
