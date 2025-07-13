class CreateMeches < ActiveRecord::Migration[8.0]
  def change
    create_table :meches do |t|
      t.string :mech_name
      t.string :variant
      t.integer :tonnage
      t.string :mech_class
      t.integer :armor_points
      t.integer :structure_points
      t.integer :speed
      t.integer :jump_jets
      t.integer :weapon_slots
      t.integer :missile_slots
      t.integer :energy_slots
      t.integer :ballistic_slots
      t.integer :heat_sinks
      t.integer :engine_rating
      t.string :tech_base
      t.integer :battle_value
      t.decimal :cost
      t.integer :introduction_year

      t.timestamps
    end
  end
end
