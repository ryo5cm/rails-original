class Picture < ActiveRecord::Base

  has_many :reviews

  has_attached_file :image,
        styles: { medium: "100x100#", thumb: "100x100#" }

  validates_attachment_content_type :image,
        content_type: ["image/jpeg", "image/png"]

end
