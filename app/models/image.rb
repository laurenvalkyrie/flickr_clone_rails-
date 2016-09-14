class Image < ApplicationRecord
  has_attached_file :image

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\z/

  belongs_to :user
  validates :caption, :user_id, :presence => true
end
