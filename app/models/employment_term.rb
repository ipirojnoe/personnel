class EmploymentTerm < ApplicationRecord
  belongs_to :user
  belongs_to :division
  belongs_to :position

  validates :begin_date, presence: true
  validate :check_begin_date

  before_validation :set_begin_date
  before_save :check_current

  scope :where_division, ->(division) { where(division: division) }
  scope :where_user, ->(user) { where(user: user) }

  private

  def check_begin_date
    employment_term = EmploymentTerm.where_user(user).where(end_date: nil)

    employment_term.first.begin_date < begin_date if employment_term.present?
  end

  def check_current
    EmploymentTerm.where(user: self.user).where(end_date: nil).update_all(end_date: Time.now)
  end

  def set_begin_date
    self.begin_date = Time.now if self.begin_date.nil?
  end
end
