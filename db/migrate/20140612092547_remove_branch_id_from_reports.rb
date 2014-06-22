class RemoveBranchIdFromReports < ActiveRecord::Migration
  def change
      remove_column :reports, :branch_id
  end
end
