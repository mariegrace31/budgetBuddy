class AddAuthorIdToExchanges < ActiveRecord::Migration[7.1]
  def change
    add_column :exchanges, :author_id, :integer
  end
end
