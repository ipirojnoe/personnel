require 'rails_helper'

RSpec.describe EmploymentTerm, type: :model do
  context 'employment term' do
    it 'should return employment term with specific division' do
      user = User.create(l_name: 'A', f_name: 'B', s_name: 'C')
      division = Division.create(name: 'А')
      position = Position.create
      user2 = User.create(l_name: 'g', f_name: 'h', s_name: 'f')
      position2 = Position.create

      EmploymentTerm.create(user: user, division: division, position: position)
      EmploymentTerm.create(user: user2, division: division, position: position2)

      expect(EmploymentTerm.where_division(division)).not_to be_nil
      expect(EmploymentTerm.where_division(division).first.user.l_name).to eq('A')
    end

    it 'should return employment term with specific user' do
      user = User.create(l_name: 'A', f_name: 'B', s_name: 'C')
      division = Division.create(name: 'А')
      position = Position.create
      position2 = Position.create

      EmploymentTerm.create(user: user, division: division, position: position)
      EmploymentTerm.create(user: user, division: division, position: position2)

      expect(EmploymentTerm.where_user(user)).not_to be_nil
      expect(EmploymentTerm.where_user(user).first.user.l_name).to eq('A')
    end
  end

  context 'employment term validations' do
    it 'should be valid' do
      user = User.create(l_name: 'A', f_name: 'B', s_name: 'C')
      division = Division.create(name: 'А')
      position = Position.create

      expect(EmploymentTerm.new(user: user, division: division, position: position)).to be_valid
    end
    
    it 'should not be valid' do
      expect(EmploymentTerm.new).not_to be_valid
    end
  end
end
