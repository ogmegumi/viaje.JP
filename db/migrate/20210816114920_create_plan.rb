class CreatePlan < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.text     :plan_content, null: false
      t.datetime :start_time, null: false
      t.datetime :finish_time, null: false
      t.string   :address
      t.float    :latitude
      t.float :longitude
      t.integer :post_id, null: false
      t.timestamps null: false
    end
  end
end
