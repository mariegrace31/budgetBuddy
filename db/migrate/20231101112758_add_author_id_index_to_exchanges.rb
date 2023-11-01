class AddAuthorIdIndexToExchanges < ActiveRecord::Migration[7.1]
  def change
    add_index :exchanges, :author_id, name: 'index_exchanges_on_author_id'
    add_foreign_key :exchanges, :users, column: :author_id
  end
end
