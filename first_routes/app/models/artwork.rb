# == Schema Information
#
# Table name: artworks
#
#  id        :integer          not null, primary key
#  title     :string           not null
#  image_url :string           not null
#  artist_id :integer          not null
#

class Artwork < ApplicationRecord
  validates :title, :image_url, :artist_id, presence: true
  validates :title, uniqueness: {
    scope: :artist_id,
    message: "One artist cannot have multiple artworks of same title"
  }

  belongs_to :artist,
             class_name: :User

  has_many :artwork_shares

  has_many :shared_viewers,
           through: :artwork_shares,
           source: :viewer

  def share_to(user)
    ArtworkShare.create(viewer_id: user.id, artwork_id: self.id)
  end
end
