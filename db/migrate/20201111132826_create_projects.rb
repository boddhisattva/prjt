class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name, not_null: true
      t.uuid :owner_id, index: true, not_null: true
      t.integer :status, default: 0, not_null: true
      t.float :progress, default: 0.0

      t.timestamps
    end

    add_index :projects, :name, unique: true
  end
end
