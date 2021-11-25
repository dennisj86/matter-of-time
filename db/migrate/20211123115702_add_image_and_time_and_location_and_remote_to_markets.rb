class AddImageAndTimeAndLocationAndRemoteToMarkets < ActiveRecord::Migration[6.0]
  def change
    add_column :markets, :image, :string
    add_column :markets, :time, :integer
    add_column :markets, :location, :string
    add_column :markets, :remote, :integer
  end
end
