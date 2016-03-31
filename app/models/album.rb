# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  band_id    :integer          not null
#  album_type :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ActiveRecord::Base
  validates :name, :band, :album_type, presence: true
  validates :album_type, inclusion: { in: ["Live", "Studio"] }


  belongs_to :band
  has_many :tracks, dependent: :destroy

end
