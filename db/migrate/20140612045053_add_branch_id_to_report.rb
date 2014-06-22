class AddBranchIdToReport < ActiveRecord::Migration
  def change
    add_column :reports, :branch_id, :integer
  end
end
