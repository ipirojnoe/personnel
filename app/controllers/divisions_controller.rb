class DivisionsController < ApplicationController
  def show
    division = Division.first

    @divisions_with_users = users_with_positions(division)
  end

  private

  def users_with_positions(division)
    division_children = division.children

    if division_children.present?
      children = division_children.map { |child| users_with_positions(child) }
    end

    employment_terms = EmploymentTerm.where_division(division)

    users_with_positions = employment_terms.map do |et|
      { name: et.user.full_name, position: et.position.position_histories.current.name }
    end

    users_with_positions = nil if users_with_positions.empty?

    users_with_positions.sort_by! { |uwp| uwp[:name] } if users_with_positions.present?
    children.sort_by! { |child| child[:division].name } if children.present?

    { division: division, users_with_positions: users_with_positions, children: children }
  end
end
