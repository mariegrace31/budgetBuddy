require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'Moha', email: 'moha@gmail.com', password: '111111') }

  it 'should have an integer user_id' do
    group = Group.new(user_id: user.id, name: 'travel', icon: 'plane')
    group.user_id = nil
    expect(group).to_not be_valid
  end

  it 'name should be presence' do
    group = Group.new(user_id: user.id, name: 'travel', icon: 'plane')
    group.name = nil
    expect(group).to_not be_valid
  end

  it 'icon should be presence' do
    group = Group.new(user_id: user.id, name: 'travel', icon: 'plane')
    group.icon = nil
    expect(group).to_not be_valid
  end

  it 'is invalid without a name' do
    group = Group.new(name: nil, icon: 'plane', user:)
    group.valid?
    expect(group.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without an icon' do
    group = Group.new(name: 'plane', icon: nil, user:)
    group.valid?
    expect(group.errors[:icon]).to include("can't be blank")
  end
end
