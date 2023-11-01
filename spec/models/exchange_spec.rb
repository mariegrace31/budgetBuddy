require 'rails_helper'

RSpec.describe Exchange, type: :model do
  let(:user) { User.create(name: 'Moha', email: 'moha@gmail.com', password: '111111') }

  it 'is valid with a name, amount, and author' do
    exchange = Exchange.new(name: 'Travel', amount: 1000, author: user)
    expect(exchange).to be_valid
  end

  it 'is invalid without a name' do
    exchange = Exchange.new(name: nil, amount: 100, author: user)
    exchange.valid?
    expect(exchange.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without an amount' do
    exchange = Exchange.new(name: 'Travel', amount: nil, author: user)
    exchange.valid?
    expect(exchange.errors[:amount]).to include("can't be blank")
  end

  it 'is invalid with a negative amount' do
    exchange = Exchange.new(name: 'Sample Exchange', amount: -10, author: user)
    exchange.valid?
    expect(exchange.errors[:amount]).to include('must be greater than or equal to 0')
  end

  it 'is invalid without an author' do
    exchange = Exchange.new(name: 'Sample Exchange', amount: 100, author: nil)
    exchange.valid?
    expect(exchange.errors[:author]).to include('must exist')
  end

  it 'should have an integer author_id' do
    exchange = Exchange.new(author_id: user.id, name: 'travel', amount: 100)
    exchange.author_id = nil
    expect(exchange).to_not be_valid
  end
end
