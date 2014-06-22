class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :url
      t.integer :pass
      t.integer :fail
      t.integer :error
      t.text :note
      t.integer :plan_id

      t.timestamps
    end
  end
end
