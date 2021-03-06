# == Schema Information
#
# Table name: cats
#
#  id          :integer          not null, primary key
#  birth_date  :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'action_view'

class Cat < ActiveRecord::Base
  include ActionView::Helpers::DateHelper

  CAT_COLORS = ["black", "white", "orange", "pink", "green"]

  validates :birth_date, :color, :name, :sex, presence: true
  validates :color, inclusion: CAT_COLORS
  validates :sex, inclusion: ["M", "F"]

  has_many :rental_requests,
    class_name: :CatRentalRequest,
    dependent: :destroy

  def age
    time_ago_in_words(birth_date)
  end
end
