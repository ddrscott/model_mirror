class BasicModels < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :iso2
      t.string :iso3
      t.string :un
      t.timestamps
    end

    create_table :homes do |t|
      t.string :address
      t.references :country
      t.timestamps
    end

    create_table :doors do |t|
      t.string :sku, index: true
      t.timestamps
    end

    create_table :home_doors do |t|
      t.references :home
      t.references :door
      t.string  :location
      t.timestamps
    end

    create_table :handles do |t|
      t.references :openable, polymorphic: true, index: true
      t.string :sku, index: true
      t.timestamps
    end

    create_table :items do |t|
      t.string :sku, index: true, unique: true
      t.integer :height
      t.integer :width
      t.integer :depth
      t.timestamps
    end
  end
end
