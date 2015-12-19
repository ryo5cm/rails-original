class Genre < ActiveRecord::Base

  has_many :pictures
end
