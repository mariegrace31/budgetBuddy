require 'rails_helper'

RSpec.describe 'Categories home ' do
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
    visit authenticated_root_path
  end

  it 'shows the title in header' do
    expect(page).to have_content('Categories')
  end

  it 'shows the category name' do
    expect(page).to have_content('Travel')
  end

  it 'show the total transaction for this category' do
    expect(page).to have_content(800)
  end

  it 'shows the icon' do
    expect(page).to have_content('icon')
  end

  it 'shows the add category button ' do
    expect(page).to have_link('Add a new category')
  end

  it 'navigates to the new category page when clicking "Add a new category"' do
    click_on 'Add a new category'
    expect(page).to have_content('Select the icon')
  end
end
