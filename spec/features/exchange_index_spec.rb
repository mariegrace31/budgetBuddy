require 'rails_helper'

RSpec.describe 'categories page ' do
  include Devise::Test::IntegrationHelpers

  before :each do
    user = User.create(name: 'Moha', email: 'moha@gmail.com', password: '111111')
    category = Group.create(user_id: user.id, name: 'Travel', icon: 'icon')

    transaction1 = Exchange.create(author_id: user.id, name: 'transaction 1', amount: 200)
    ExchangeGroup.create(exchange_id: transaction1.id, group_id: category.id)
    transaction2 = Exchange.create(author_id: user.id, name: 'transaction 2', amount: 200)
    ExchangeGroup.create(exchange_id: transaction2.id, group_id: category.id)
    transaction3 = Exchange.create(author_id: user.id, name: 'transaction 3', amount: 400)
    ExchangeGroup.create(exchange_id: transaction3.id, group_id: category.id)

    sign_in user
    visit category_exchanges_path(category_id: category.id)
  end

  it 'shows the title in header' do
    expect(page).to have_content('Transaction')
  end

  it 'shows the category name' do
    expect(page).to have_content('Travel')
  end

  it 'shows the total transaction for this category' do
    expect(page).to have_content(800)
  end

  it 'shows the all transaction' do
    expect(page).to have_content('transaction 1')
    expect(page).to have_content('200')
    expect(page).to have_content('transaction 2')
    expect(page).to have_content('200')
    expect(page).to have_content('transaction 3')
    expect(page).to have_content('400')
  end

  it 'shows the add transaction button' do
    expect(page).to have_link('Add a new Transaction')
  end

  it 'navigates to the new category page when clicking "Add a new Transaction"' do
    click_on 'Add a new Transaction'
    expect(page).to have_content('New Transaction')
  end
end
