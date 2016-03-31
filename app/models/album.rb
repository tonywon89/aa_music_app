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
  validates :name, :band_id, :album_type, presence: true
  validates :album_type, inclusion: { in: %w(Live, Studio) }
  validates :band_id, uniqueness: true

  belongs_to :band
  has_many :tracks

end
