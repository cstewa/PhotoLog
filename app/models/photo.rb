class Photo < ActiveRecord::Base
  attr_accessible :album_id, :name, :picture

  belongs_to :album
  has_many :comments

  mount_uploader :picture, ImageUploader 
end
