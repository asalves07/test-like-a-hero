class CreateWeapons < ActiveRecord::Migration[6.0]
  def change
    create_table :weapons do |t|
      t.string :weaponName
      t.string :description
      t.integer :power_base
      t.integer :power_step
      t.integer :weapon_level, default: 1

      t.timestamps
    end
  end
end
