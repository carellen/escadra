class AddStatusToPosition < ActiveRecord::Migration[5.2]
  def change
    add_column :positions, :status, :boolean, default: false
  end
end
