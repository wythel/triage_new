class AddBuildToReport < ActiveRecord::Migration
  def change
    add_column :reports, :build, :integer
  end
end
