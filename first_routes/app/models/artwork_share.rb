# == Schema Information
#
# Table name: artwork_shares
#
#  id         :integer          not null, primary key
#  viewer_id  :integer          not null
#  artwork_id :integer          not null
#

class ArtworkShare < ApplicationRecord
  validates :viewer_id, :artwork_id, presence: true
  validates :artwork_id, uniqueness: {
    scope: :viewer_id,
    message: "Same viewer cannot view same artwork multiple times"
  }

  belongs_to :viewer,
             class_name: :User

  belongs_to :artwork
end
