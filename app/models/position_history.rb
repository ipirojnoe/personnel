class PositionHistory < ApplicationRecord
  belongs_to :position

  validates :name, :begin_date, presence: true

  before_validation :set_begin_date
  before_save :check_current

  def self.current
    self.select { |position| position.end_date.nil? }.pop
  end

  private

  def check_current
    PositionHistory.where(position: self.position).where(end_date: nil).update_all(end_date: Time.now)
  end

  def set_begin_date
    self.begin_date = Time.now if self.begin_date.nil?
  end
end
