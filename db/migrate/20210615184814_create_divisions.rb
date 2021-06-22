class CreateDivisions < ActiveRecord::Migration[6.0]
  def up
    create_table :divisions do |t|
      t.string :name, null: false
      t.references :parent, index: true

      t.timestamps
    end

    Division.create(name: 1)
    Division.create(name: 2, parent_id: 1)
    Division.create(name: 3, parent_id: 1)
    Division.create(name: 4, parent_id: 3)
    Division.create(name: 5, parent_id: 3)
    Division.create(name: 6, parent_id: 3)
    Division.create(name: 7, parent_id: 4)
    Division.create(name: 8, parent_id: 5)
    Division.create(name: 9, parent_id: 8)
  end

  def down
    drop_table :divisions
  end
end
