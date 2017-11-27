class CreateAllDashboardTables < ActiveRecord::Migration[5.1]
  def change
    create_table :marathons do |t|
      t.string :name, null: false
      t.text :description

      t.timestamps

      t.index [:name], unique: true
    end

    create_table :events do |t|
      t.string :name, null: false
      t.text :description
      t.references :marathon, foreign_key: true, null: false

      t.timestamps null: false

      t.index [:name, :marathon_id], unique: true
    end

    create_table :items do |t|
      t.string :name, null: false
      t.text :description
      t.references :event, foreign_key: true, null: false

      t.timestamps null: false

      t.index [:name, :event_id], unique: true
    end

    create_table :item_states do |t|
      t.string :name, null: false
      t.text :description
      t.references :item, foreign_key: true, null: false

      t.timestamps null: false

      t.index [:name, :item_id], unique: true
    end

    create_table :bids do |t|
      t.decimal :amount, precision: 7, scale: 2, null: false
      t.references :item_state, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
