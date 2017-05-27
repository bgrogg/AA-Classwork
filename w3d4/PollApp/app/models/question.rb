# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  poll_id    :integer          not null
#  text       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ActiveRecord::Base
  validates :poll, :text, presence: true

  has_many :answer_choices
  belongs_to :poll

  has_many :responses, through: :answer_choices
end
