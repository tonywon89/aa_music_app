# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  track_id   :integer          not null
#  content    :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Note < ActiveRecord::Base
  validates :user_id, :track_id, :content, presence: true

  belongs_to :author, foreign_key: :user_id, class_name: "User"
  belongs_to :track
end
