# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  answer_choice_id :integer          not null
#  respondent_id    :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ActiveRecord::Base
  validates :answer_choice, :respondent, presence: true

  belongs_to :answer_choice

  belongs_to :respondent, class_name: "User"

  has_one :question, through: :answer_choice

  validate :respondent_already_answered?

  def sibling_responses
    binds = { answer_choice_id: self.answer_choice_id, id: self.id }
    Response.find_by_sql([<<-SQL, binds])
      SELECT
        responses.*
      FROM (
        SELECT
          questions.*
        FROM
          questions
        JOIN
          answer_choices ON questions.id = answer_choices.question_id
        WHERE
          answer_choices.id = :answer_choice_id
        ) AS questions
        JOIN
          answer_choices ON questions.id = answer_choices.question_id
        JOIN
          responses ON answer_choices.id = responses.answer_choice_id
        WHERE
          (:id IS NULL) OR (responses.id != :id)
    SQL
  end

  private

  def respondent_already_answered?
    if sibling_responses.exists?(respondent_id: self.respondent_id)
      errors[:respondent_id] << "cannot vote twice for question"
    end
  end
end
