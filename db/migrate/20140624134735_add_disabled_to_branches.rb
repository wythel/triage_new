class AddDisabledToBranches < ActiveRecord::Migration
  def change
    add_column :branches, :disabled, :boolean, default: false
  end
end
