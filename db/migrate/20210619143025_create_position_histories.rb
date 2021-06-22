class CreatePositionHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :position_histories do |t|
      t.string :name, null: false
      t.references :position, null: false, foreign_key: true
      t.date :begin_date, null: false
      t.date :end_date

      t.timestamps
    end
  end
end
