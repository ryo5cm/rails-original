class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar,
        styles: { medium: "100x100#", thumb: "100x100#" }

  validates_attachment_content_type :avatar,
        content_type: ["image/jpeg", "image/png"]

  has_many :reviews
  has_many :pictures
  has_many :likes
  has_many :like_pictures, through: :likes, source: :pictures

  validates :nickname, :password, :gender, presence: true
  validates :email, presence: true, uniqueness: true
end
