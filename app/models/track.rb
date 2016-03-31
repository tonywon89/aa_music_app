# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  album_id   :integer          not null
#  track_type :string           not null
#  lyrics     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ActiveRecord::Base
  validates :name, :album, :track_type, presence: true
  validates :track_type, inclusion: { in: ["Regular", "Bonus"]}

  belongs_to :album
  has_many :notes

end
