require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  context 'user name' do
    it 'should return full name' do
      expect(user.full_name).to include(user.l_name)
    end
  end

  context 'user validations' do
    it 'should be valid' do
      expect(User.new(l_name: 'А', f_name: 'b', s_name: 'r')).to be_valid
    end
    it 'should not be valid' do
      expect(User.new(l_name: 'А', f_name: 'b')).not_to be_valid
    end
  end
end
