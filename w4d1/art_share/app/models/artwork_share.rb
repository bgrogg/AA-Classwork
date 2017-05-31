# == Schema Information
#
# Table name: artwork_shares
#
#  id         :integer          not null, primary key
#  artwork_id :integer          not null
#  viewer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ArtworkShare < ActiveRecord::Base
  validates :artwork, :viewer, presence: true
  validates :artwork_id, uniqueness: { scope: :viewer_id }

  belongs_to :artwork
  belongs_to :viewer, class_name: :User
end
