class Division < ApplicationRecord
  has_many :divisions, foreign_key: 'parent_id'

  validates :name, presence: true

  def children
    Division.where(parent_id: self.id)
  end
end
