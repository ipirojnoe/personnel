class User < ApplicationRecord
  validates :l_name, :f_name, :s_name, presence: true

  def full_name
    "#{f_name.capitalize} #{l_name.capitalize} #{s_name.capitalize}"
  end
end
