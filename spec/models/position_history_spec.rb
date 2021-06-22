require 'rails_helper'

RSpec.describe PositionHistory, type: :model do
  context 'position history' do
    it 'should have only begin date' do
      position = Position.create
      position_history1 = PositionHistory.create(name: 'Ж', position: position)

      expect(position_history1.begin_date).to be
      expect(position_history1.end_date).to be_nil
    end

    it 'should return current position name' do
      position = Position.create
      PositionHistory.create(name: 'Ж', position: position)
      PositionHistory.create(name: 'Б', position: position)

      expect(position.position_histories.current.name).to eq('Б')
      expect(PositionHistory.find_by(name: 'Ж').end_date).not_to be_nil
    end
  end

  context 'position history validations' do
    it 'should be valid' do
      position = Position.create
      expect(position.position_histories.create(name: 'А')).to be_valid
    end
    it 'should not be valid' do
      expect(PositionHistory.new).not_to be_valid
    end
  end
end
