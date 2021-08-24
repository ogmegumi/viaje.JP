class CreatePlanDays < ActiveRecord::Migration[5.2]
  def change
    create_table :plan_days do |t|
      t.references :post, null: false, foreign_key: true
      t.datetime :days, null: false
      t.timestamps
    end
  end
end
