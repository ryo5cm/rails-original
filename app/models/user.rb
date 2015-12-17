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

  validates :nickname, :email, :password, :gender, presence: true
end
