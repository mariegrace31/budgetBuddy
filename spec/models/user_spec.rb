require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(name: 'Moha', email: 'moha@gmail.com', password: '111111') }
  describe 'validations' do
    it 'Is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'Is not valid without a name' do
      user.name = nil
      expect(user).to_not be_valid
    end

    it 'Is not valid without an email' do
      user.email = nil
      expect(user).to_not be_valid
    end
  end
end
