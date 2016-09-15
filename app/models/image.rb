class Image < ApplicationRecord
  has_attached_file :image

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\z/

  belongs_to :user
  has_and_belongs_to_many :tagged_users, class_name: "User"
  has_and_belongs_to_many :users_who_favorited, join_table: 'favorites', class_name: "User"
  validates :caption, :user_id, :presence => true
end
