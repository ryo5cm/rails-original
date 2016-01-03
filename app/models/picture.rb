class Picture < ActiveRecord::Base

  has_many :reviews
  belongs_to :user

  belongs_to :genre
  has_many :likes

  has_many :liking_users, through: :likes, source: :user

  has_attached_file :image,
        styles: { medium: "100x100#", thumb: "100x100#" }

  validates_attachment_content_type :image,
        content_type: ["image/jpeg", "image/png"]

  validates :image, presence: true
  validates :genre_id, presence: true
  validates :comment, presence: true, length: { maximum: 500 }

end
