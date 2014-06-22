class AddBranchIdToPlans < ActiveRecord::Migration
  def change
    add_column :plans, :branch_id, :integer
  end
end
