# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true

  has_many :artworks,
           foreign_key: :artist_id,
           dependent: :destroy

  has_many :artwork_shares,
           foreign_key: :viewer_id,
           dependent: :destroy

  has_many :shared_artworks,
           through: :artwork_shares,
           source: :artwork

  has_many :comments

  def create_artwork(options)
    Artwork.create(
    title: options[:title],
    image_url: options[:image_url],
    artist_id: self.id)
  end

  def write_comment(artwork, comment_str)
    Comment.create(user_id: self.id, artwork_id: artwork.id, body: comment_str)
  end
end
