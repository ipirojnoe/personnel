class CreateEmploymentTerms < ActiveRecord::Migration[6.0]
  def change
    create_table :employment_terms do |t|
      t.references :user, null: false, foreign_key: true
      t.references :division, null: false, foreign_key: true
      t.references :position, null: false, foreign_key: true
      t.date :begin_date, null: false
      t.date :end_date

      t.timestamps
    end
  end
end
