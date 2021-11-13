class AddStatusToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :status, :boolean, default: false
  end
end
