class CreateBusinessWorkingHours < ActiveRecord::Migration[6.0]
  def change
    create_table :business_working_hours do |t|
      t.integer :day
      t.date :opens_at
      t.date :closed_at
      t.string :workable_type
      t.integer :workable_id

      t.timestamps
    end
  end
end
