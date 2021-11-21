class AddDescriptionAndWalletAndDateOfBirthToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :description, :string
    add_column :users, :wallet, :integer
    add_column :users, :birth_date, :date
  end
end
