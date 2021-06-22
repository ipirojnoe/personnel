require 'rails_helper'

RSpec.describe Division, type: :model do
  context 'division children' do
    it 'should have children' do
      division1 = Division.create(name: 'А')
      division2 = Division.create(name: 'Ж', parent_id: division1.id)
      division3 = Division.create(name: 'Б', parent_id: division1.id)
      
      expect(division1.children).not_to be_empty
      expect(division1.children).to include(division2)
      expect(division1.children).to include(division3)
    end
  end
  
  context 'division validations' do
    it 'should be valid' do
      expect(Division.new(name: 'А')).to be_valid
    end
    it 'should not be valid' do
      expect(Division.new).not_to be_valid
    end
  end
end
