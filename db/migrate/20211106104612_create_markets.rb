class CreateMarkets < ActiveRecord::Migration[6.0]
  def change
    create_table :markets do |t|
      t.string :category
      t.text :description
      t.string :title
      t.integer :offer_request
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
