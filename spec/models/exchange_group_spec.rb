require 'rails_helper'

RSpec.describe ExchangeGroup, type: :model do
  describe 'Exchange model' do
    let(:user) { User.create(name: 'Moha', email: 'moha@gmail.com', password: '111111') }
    let(:exchange) { Exchange.create(author_id: user.id, name: 'ticket', amount: 100) }
    let(:group) { Group.create(user_id: user.id, name: 'Plane', icon: 'icon') }

    it 'entity_id should be presence' do
      exchange_group = ExchangeGroup.new(exchange_id: exchange.id, group_id: group.id)
      exchange_group.exchange_id = nil
      expect(exchange_group).to_not be_valid
    end

    it 'group_id should be presence' do
      exchange_group = ExchangeGroup.new(exchange_id: exchange.id, group_id: group.id)
      exchange_group.group_id = nil
      expect(exchange_group).to_not be_valid
    end
  end
end
