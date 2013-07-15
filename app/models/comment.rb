class Comment < ActiveRecord::Base
  attr_accessible :content, :photo_id

  belongs_to :photo
end
