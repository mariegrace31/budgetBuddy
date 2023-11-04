class ExchangesController < ApplicationController
  def index
    @category = Group.find(params[:category_id])
    @exchanges = @category.exchanges.order(created_at: :desc)
    @total = @exchanges.map(&:amount).sum
  end

  def new
    @exchange = Exchange.new
    @category = Group.find(params[:category_id])
  end

  def create
    @purchase = Exchange.new(exchanges_params)
    @category = Group.find(params[:category_id])

    if @purchase.save
      ExchangeGroup.create(group_id: @category.id, exchange_id: @purchase.id)
      redirect_to category_exchanges_path(group_id: @category.id), notice: 'Transaction was successfully created.'
    else
      redirect_to new_category_exchanges_path(group_id: @category.id), notice: 'Transaction can\'t be created'
    end
  end

  private

  def exchanges_params
    params.require(:exchange).permit(:name, :amount).merge(author_id: current_user.id)
  end
end
