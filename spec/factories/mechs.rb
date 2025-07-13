FactoryBot.define do
  factory :mech do
    mech_name { "Atlas" }
    variant { "AS7-D" }
    tonnage { 100 }
    mech_class { "Assault" }
    armor_points { 307 }
    structure_points { 152 }
    speed { 54 }
    jump_jets { 0 }
    weapon_slots { 12 }
    missile_slots { 2 }
    energy_slots { 4 }
    ballistic_slots { 2 }
    heat_sinks { 20 }
    engine_rating { 300 }
    tech_base { "Inner Sphere" }
    battle_value { 1557 }
    cost { 9682000.0 }
    introduction_year { 2755 }

    trait :awesome do
      mech_name { "Awesome" }
      variant { "AWS-8Q" }
      tonnage { 80 }
      mech_class { "Assault" }
      armor_points { 247 }
      structure_points { 122 }
      speed { 64 }
      jump_jets { 0 }
      weapon_slots { 8 }
      missile_slots { 0 }
      energy_slots { 3 }
      ballistic_slots { 0 }
      heat_sinks { 28 }
      engine_rating { 240 }
      battle_value { 1358 }
      cost { 6436000.0 }
      introduction_year { 2665 }
    end

    trait :marauder do
      mech_name { "Marauder" }
      variant { "MAD-3R" }
      tonnage { 75 }
      mech_class { "Heavy" }
      armor_points { 216 }
      structure_points { 114 }
      speed { 64 }
      jump_jets { 0 }
      weapon_slots { 10 }
      missile_slots { 0 }
      energy_slots { 2 }
      ballistic_slots { 2 }
      heat_sinks { 20 }
      engine_rating { 300 }
      battle_value { 1089 }
      cost { 5741000.0 }
      introduction_year { 2612 }
    end

    trait :battlemaster do
      mech_name { "BattleMaster" }
      variant { "BLR-1G" }
      tonnage { 85 }
      mech_class { "Assault" }
      armor_points { 272 }
      structure_points { 130 }
      speed { 64 }
      jump_jets { 0 }
      weapon_slots { 11 }
      missile_slots { 1 }
      energy_slots { 6 }
      ballistic_slots { 1 }
      heat_sinks { 20 }
      engine_rating { 340 }
      battle_value { 1212 }
      cost { 8501000.0 }
      introduction_year { 2633 }
    end

    trait :mad_cat do
      mech_name { "Mad Cat" }
      variant { "Timber Wolf Prime" }
      tonnage { 75 }
      mech_class { "Heavy" }
      armor_points { 211 }
      structure_points { 114 }
      speed { 86 }
      jump_jets { 0 }
      weapon_slots { 12 }
      missile_slots { 2 }
      energy_slots { 2 }
      ballistic_slots { 2 }
      heat_sinks { 17 }
      engine_rating { 375 }
      tech_base { "Clan" }
      battle_value { 2251 }
      cost { 23567000.0 }
      introduction_year { 2945 }
    end

    trait :dire_wolf do
      mech_name { "Dire Wolf" }
      variant { "Daishi Prime" }
      tonnage { 100 }
      mech_class { "Assault" }
      armor_points { 307 }
      structure_points { 152 }
      speed { 54 }
      jump_jets { 0 }
      weapon_slots { 16 }
      missile_slots { 2 }
      energy_slots { 4 }
      ballistic_slots { 4 }
      heat_sinks { 26 }
      engine_rating { 300 }
      tech_base { "Clan" }
      battle_value { 3060 }
      cost { 29455000.0 }
      introduction_year { 2945 }
    end
  end
end
