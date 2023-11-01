require 'rails_helper'

RSpec.feature "CategoriesIndices", type: :feature do
  before :each do
    visit unauthenticated_root_path
  end

  it 'shows the logo ' do
    expect(page).to have_content('Budget Beam')
  end

  it 'shows the Log in button ' do
    expect(page).to have_content('Log In')
  end

  it 'shows the sign up button' do
    expect(page).to have_content('Sign up')
  end
end
