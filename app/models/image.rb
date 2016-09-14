class Image < ApplicationRecord
  has_attached_file :image, styles: {thumb: "100x100#"}
  
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\z/

  belongs_to :user
  validates :caption, :user_id, :presence => true
end
