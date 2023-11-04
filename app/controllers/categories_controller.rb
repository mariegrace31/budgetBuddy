class CategoriesController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index; end

  def home
    @categories = current_user.groups
  end

  def new
    @group = Group.new
    @choices = [
      ['🛒'],
      ['🛩️'],
      ['🍽️'],
      ['🚗'],
      ['🏠'],
      ['🛍️'],
      ['🏥'],
      ['🎓'],
      ['📦'],
      ['🎮']
    ]
  end

  def create
    @category = Group.new(categories_params)
    if @category.save
      redirect_to home_categories_path, notice: 'Category was successfully created'
    else
      redirect_to new_category_path, notice: 'Can\'t create a new category'
    end
  end

  private

  def categories_params
    params.require(:group).permit(:name, :icon).merge(user: current_user)
  end
end
