class CreateExchangeGroups < ActiveRecord::Migration[7.1]
  def change
    create_table :exchange_groups do |t|
      t.references :exchange, null: false, foreign_key: true
      t.references :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
