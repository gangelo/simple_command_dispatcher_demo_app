# frozen_string_literal: true

puts "Seeding MechWarrior 5 Mechs Database..."

# Use create! method instead of insert_all to avoid key mismatch issues
mechs_to_create = [
  # === LIGHT MECHS (20-35 tons) ===

  # Locust - Fast Scout
  { mech_name: "Locust", variant: "LCT-1V", tonnage: 20, mech_class: "Light", armor_points: 64, structure_points: 34, speed: 129, jump_jets: 0, weapon_slots: 4, missile_slots: 0, energy_slots: 2, ballistic_slots: 2, heat_sinks: 10, engine_rating: 160, tech_base: "Inner Sphere", battle_value: 356, cost: 1_512_401.0, introduction_year: 2499 },
  { mech_name: "Locust", variant: "LCT-PB", tonnage: 20, mech_class: "Light", armor_points: 72, structure_points: 34, speed: 162, jump_jets: 0, weapon_slots: 4, missile_slots: 0, energy_slots: 4, ballistic_slots: 0, heat_sinks: 12, engine_rating: 200, tech_base: "Inner Sphere", battle_value: 540, cost: 2_100_000.0, introduction_year: 2499 },

  # Commando - Jump Infantry Support
  { mech_name: "Commando", variant: "COM-2D", tonnage: 25, mech_class: "Light", armor_points: 80, structure_points: 43, speed: 97, jump_jets: 3, weapon_slots: 4, missile_slots: 2, energy_slots: 2, ballistic_slots: 0, heat_sinks: 10, engine_rating: 150, tech_base: "Inner Sphere", battle_value: 543, cost: 1_891_250.0, introduction_year: 2486 },
  { mech_name: "Commando", variant: "COM-TDK", tonnage: 25, mech_class: "Light", armor_points: 95, structure_points: 43, speed: 97, jump_jets: 3, weapon_slots: 4, missile_slots: 2, energy_slots: 2, ballistic_slots: 0, heat_sinks: 12, engine_rating: 150, tech_base: "Inner Sphere", battle_value: 663, cost: 2_200_000.0, introduction_year: 2486 },

  # Javelin - Missile Boat
  { mech_name: "Javelin", variant: "JVN-10N", tonnage: 30, mech_class: "Light", armor_points: 96, structure_points: 51, speed: 111, jump_jets: 6, weapon_slots: 4, missile_slots: 4, energy_slots: 0, ballistic_slots: 0, heat_sinks: 10, engine_rating: 210, tech_base: "Inner Sphere", battle_value: 512, cost: 2_400_000.0, introduction_year: 2751 },
  { mech_name: "Javelin", variant: "JVN-HT", tonnage: 30, mech_class: "Light", armor_points: 111, structure_points: 51, speed: 111, jump_jets: 6, weapon_slots: 6, missile_slots: 4, energy_slots: 2, ballistic_slots: 0, heat_sinks: 12, engine_rating: 210, tech_base: "Inner Sphere", battle_value: 655, cost: 2_800_000.0, introduction_year: 2751 },

  # Spider - Jump Sniper
  { mech_name: "Spider", variant: "SDR-5V", tonnage: 30, mech_class: "Light", armor_points: 96, structure_points: 51, speed: 129, jump_jets: 6, weapon_slots: 4, missile_slots: 0, energy_slots: 4, ballistic_slots: 0, heat_sinks: 10, engine_rating: 240, tech_base: "Inner Sphere", battle_value: 514, cost: 2_984_540.0, introduction_year: 2650 },
  { mech_name: "Spider", variant: "SDR-A", tonnage: 30, mech_class: "Light", armor_points: 111, structure_points: 51, speed: 129, jump_jets: 6, weapon_slots: 6, missile_slots: 0, energy_slots: 4, ballistic_slots: 0, heat_sinks: 14, engine_rating: 240, tech_base: "Inner Sphere", battle_value: 732, cost: 3_500_000.0, introduction_year: 2650 },

  # Urbanmech - Slow Tank
  { mech_name: "Urbanmech", variant: "UM-R60", tonnage: 30, mech_class: "Light", armor_points: 111, structure_points: 51, speed: 32, jump_jets: 2, weapon_slots: 3, missile_slots: 0, energy_slots: 1, ballistic_slots: 1, heat_sinks: 10, engine_rating: 60, tech_base: "Inner Sphere", battle_value: 454, cost: 1_471_925.0, introduction_year: 2675 },
  { mech_name: "Urbanmech", variant: "UM-K9", tonnage: 30, mech_class: "Light", armor_points: 111, structure_points: 51, speed: 54, jump_jets: 2, weapon_slots: 4, missile_slots: 0, energy_slots: 1, ballistic_slots: 1, heat_sinks: 12, engine_rating: 100, tech_base: "Inner Sphere", battle_value: 634, cost: 2_000_000.0, introduction_year: 2675 },

  # Firestarter - Close Combat
  { mech_name: "Firestarter", variant: "FS9-H", tonnage: 35, mech_class: "Light", armor_points: 125, structure_points: 59, speed: 97, jump_jets: 6, weapon_slots: 6, missile_slots: 0, energy_slots: 4, ballistic_slots: 0, heat_sinks: 10, engine_rating: 210, tech_base: "Inner Sphere", battle_value: 575, cost: 3_046_950.0, introduction_year: 3025 },
  { mech_name: "Firestarter", variant: "FS9-E", tonnage: 35, mech_class: "Light", armor_points: 125, structure_points: 59, speed: 97, jump_jets: 6, weapon_slots: 6, missile_slots: 0, energy_slots: 6, ballistic_slots: 0, heat_sinks: 16, engine_rating: 210, tech_base: "Inner Sphere", battle_value: 750, cost: 3_800_000.0, introduction_year: 3025 },

  # Raven - Electronic Warfare
  { mech_name: "Raven", variant: "RVN-1X", tonnage: 35, mech_class: "Light", armor_points: 104, structure_points: 59, speed: 97, jump_jets: 6, weapon_slots: 4, missile_slots: 2, energy_slots: 1, ballistic_slots: 1, heat_sinks: 10, engine_rating: 210, tech_base: "Inner Sphere", battle_value: 785, cost: 3_676_380.0, introduction_year: 3024 },
  { mech_name: "Raven", variant: "RVN-H", tonnage: 35, mech_class: "Light", armor_points: 125, structure_points: 59, speed: 97, jump_jets: 6, weapon_slots: 6, missile_slots: 2, energy_slots: 2, ballistic_slots: 0, heat_sinks: 14, engine_rating: 210, tech_base: "Inner Sphere", battle_value: 1044, cost: 4_200_000.0, introduction_year: 3024 },

  # === MEDIUM MECHS (40-55 tons) ===

  # Centurion - All-Rounder
  { mech_name: "Centurion", variant: "CN9-A", tonnage: 50, mech_class: "Medium", armor_points: 144, structure_points: 83, speed: 65, jump_jets: 0, weapon_slots: 6, missile_slots: 2, energy_slots: 2, ballistic_slots: 2, heat_sinks: 13, engine_rating: 200, tech_base: "Inner Sphere", battle_value: 772, cost: 3_563_126.0, introduction_year: 2801 },
  { mech_name: "Centurion", variant: "CN9-YLW", tonnage: 50, mech_class: "Medium", armor_points: 175, structure_points: 83, speed: 65, jump_jets: 0, weapon_slots: 6, missile_slots: 0, energy_slots: 2, ballistic_slots: 2, heat_sinks: 16, engine_rating: 200, tech_base: "Inner Sphere", battle_value: 1278, cost: 5_200_000.0, introduction_year: 2801 },

  # Hunchback - Ballistic Heavy Hitter
  { mech_name: "Hunchback", variant: "HBK-4G", tonnage: 50, mech_class: "Medium", armor_points: 152, structure_points: 83, speed: 65, jump_jets: 0, weapon_slots: 6, missile_slots: 0, energy_slots: 2, ballistic_slots: 4, heat_sinks: 13, engine_rating: 200, tech_base: "Inner Sphere", battle_value: 851, cost: 3_467_876.0, introduction_year: 2572 },
  { mech_name: "Hunchback", variant: "HBK-GI", tonnage: 50, mech_class: "Medium", armor_points: 175, structure_points: 83, speed: 65, jump_jets: 0, weapon_slots: 8, missile_slots: 2, energy_slots: 2, ballistic_slots: 4, heat_sinks: 16, engine_rating: 200, tech_base: "Inner Sphere", battle_value: 1380, cost: 5_000_000.0, introduction_year: 2572 },

  # Kintaro - Missile Support
  { mech_name: "Kintaro", variant: "KTO-19", tonnage: 55, mech_class: "Medium", armor_points: 168, structure_points: 91, speed: 65, jump_jets: 0, weapon_slots: 8, missile_slots: 6, energy_slots: 2, ballistic_slots: 0, heat_sinks: 10, engine_rating: 220, tech_base: "Inner Sphere", battle_value: 1244, cost: 4_749_408.0, introduction_year: 2587 },
  { mech_name: "Kintaro", variant: "KTO-GB", tonnage: 55, mech_class: "Medium", armor_points: 191, structure_points: 91, speed: 65, jump_jets: 0, weapon_slots: 8, missile_slots: 6, energy_slots: 2, ballistic_slots: 0, heat_sinks: 16, engine_rating: 220, tech_base: "Inner Sphere", battle_value: 1489, cost: 6_000_000.0, introduction_year: 2587 },

  # Shadow Hawk - Jump Combatant
  { mech_name: "Shadow Hawk", variant: "SHD-2H", tonnage: 55, mech_class: "Medium", armor_points: 168, structure_points: 91, speed: 81, jump_jets: 3, weapon_slots: 6, missile_slots: 2, energy_slots: 2, ballistic_slots: 2, heat_sinks: 10, engine_rating: 275, tech_base: "Inner Sphere", battle_value: 918, cost: 4_539_688.0, introduction_year: 2550 },
  { mech_name: "Shadow Hawk", variant: "SHD-GD", tonnage: 55, mech_class: "Medium", armor_points: 191, structure_points: 91, speed: 81, jump_jets: 3, weapon_slots: 8, missile_slots: 2, energy_slots: 2, ballistic_slots: 2, heat_sinks: 16, engine_rating: 275, tech_base: "Inner Sphere", battle_value: 1380, cost: 6_200_000.0, introduction_year: 2550 },

  # Wolverine - Versatile Fighter
  { mech_name: "Wolverine", variant: "WVR-6R", tonnage: 55, mech_class: "Medium", armor_points: 191, structure_points: 91, speed: 65, jump_jets: 3, weapon_slots: 6, missile_slots: 2, energy_slots: 2, ballistic_slots: 2, heat_sinks: 10, engine_rating: 220, tech_base: "Inner Sphere", battle_value: 1101, cost: 4_827_683.0, introduction_year: 2575 },
  { mech_name: "Wolverine", variant: "WVR-Q", tonnage: 55, mech_class: "Medium", armor_points: 191, structure_points: 91, speed: 65, jump_jets: 3, weapon_slots: 8, missile_slots: 0, energy_slots: 6, ballistic_slots: 0, heat_sinks: 16, engine_rating: 220, tech_base: "Inner Sphere", battle_value: 1456, cost: 6_500_000.0, introduction_year: 2575 },

  # === HEAVY MECHS (60-75 tons) ===

  # Dragon - Long Range Support
  { mech_name: "Dragon", variant: "DRG-1N", tonnage: 60, mech_class: "Heavy", armor_points: 207, structure_points: 99, speed: 81, jump_jets: 0, weapon_slots: 6, missile_slots: 2, energy_slots: 2, ballistic_slots: 2, heat_sinks: 12, engine_rating: 300, tech_base: "Inner Sphere", battle_value: 999, cost: 5_150_440.0, introduction_year: 2754 },
  { mech_name: "Dragon", variant: "DRG-FANG", tonnage: 60, mech_class: "Heavy", armor_points: 207, structure_points: 99, speed: 81, jump_jets: 0, weapon_slots: 8, missile_slots: 2, energy_slots: 4, ballistic_slots: 2, heat_sinks: 16, engine_rating: 300, tech_base: "Inner Sphere", battle_value: 1456, cost: 7_200_000.0, introduction_year: 2754 },

  # Catapult - LRM Boat
  { mech_name: "Catapult", variant: "CPLT-A1", tonnage: 65, mech_class: "Heavy", armor_points: 192, structure_points: 107, speed: 65, jump_jets: 4, weapon_slots: 8, missile_slots: 6, energy_slots: 2, ballistic_slots: 0, heat_sinks: 14, engine_rating: 260, tech_base: "Inner Sphere", battle_value: 1165, cost: 5_790_270.0, introduction_year: 2561 },
  { mech_name: "Catapult", variant: "CPLT-J", tonnage: 65, mech_class: "Heavy", armor_points: 217, structure_points: 107, speed: 65, jump_jets: 2, weapon_slots: 8, missile_slots: 6, energy_slots: 2, ballistic_slots: 0, heat_sinks: 20, engine_rating: 260, tech_base: "Inner Sphere", battle_value: 1750, cost: 8_500_000.0, introduction_year: 2561 },

  # JagerMech - Ballistic Platform
  { mech_name: "JagerMech", variant: "JM6-S", tonnage: 65, mech_class: "Heavy", armor_points: 184, structure_points: 107, speed: 65, jump_jets: 0, weapon_slots: 8, missile_slots: 2, energy_slots: 2, ballistic_slots: 4, heat_sinks: 10, engine_rating: 260, tech_base: "Inner Sphere", battle_value: 1020, cost: 5_376_470.0, introduction_year: 2775 },
  { mech_name: "JagerMech", variant: "JM6-FB", tonnage: 65, mech_class: "Heavy", armor_points: 217, structure_points: 107, speed: 65, jump_jets: 0, weapon_slots: 8, missile_slots: 0, energy_slots: 4, ballistic_slots: 4, heat_sinks: 16, engine_rating: 260, tech_base: "Inner Sphere", battle_value: 1380, cost: 7_000_000.0, introduction_year: 2775 },

  # Thunderbolt - Multi-Role
  { mech_name: "Thunderbolt", variant: "TDR-5S", tonnage: 65, mech_class: "Heavy", armor_points: 200, structure_points: 107, speed: 65, jump_jets: 0, weapon_slots: 8, missile_slots: 2, energy_slots: 4, ballistic_slots: 2, heat_sinks: 15, engine_rating: 260, tech_base: "Inner Sphere", battle_value: 1015, cost: 5_446_761.0, introduction_year: 2670 },
  { mech_name: "Thunderbolt", variant: "TDR-5S-T", tonnage: 65, mech_class: "Heavy", armor_points: 217, structure_points: 107, speed: 65, jump_jets: 0, weapon_slots: 8, missile_slots: 0, energy_slots: 6, ballistic_slots: 2, heat_sinks: 18, engine_rating: 260, tech_base: "Inner Sphere", battle_value: 1456, cost: 7_500_000.0, introduction_year: 2670 },

  # Warhammer - Energy Heavy
  { mech_name: "Warhammer", variant: "WHM-6R", tonnage: 70, mech_class: "Heavy", armor_points: 208, structure_points: 115, speed: 65, jump_jets: 0, weapon_slots: 8, missile_slots: 2, energy_slots: 6, ballistic_slots: 0, heat_sinks: 17, engine_rating: 280, tech_base: "Inner Sphere", battle_value: 1283, cost: 5_958_765.0, introduction_year: 2515 },
  { mech_name: "Warhammer", variant: "WHM-BW", tonnage: 70, mech_class: "Heavy", armor_points: 223, structure_points: 115, speed: 65, jump_jets: 0, weapon_slots: 8, missile_slots: 2, energy_slots: 6, ballistic_slots: 0, heat_sinks: 20, engine_rating: 280, tech_base: "Inner Sphere", battle_value: 1750, cost: 8_200_000.0, introduction_year: 2515 },

  # Marauder - Command Mech
  { mech_name: "Marauder", variant: "MAD-3R", tonnage: 75, mech_class: "Heavy", armor_points: 216, structure_points: 123, speed: 65, jump_jets: 0, weapon_slots: 6, missile_slots: 0, energy_slots: 4, ballistic_slots: 2, heat_sinks: 16, engine_rating: 300, tech_base: "Inner Sphere", battle_value: 1089, cost: 6_116_438.0, introduction_year: 2612 },
  { mech_name: "Marauder", variant: "MAD-BH", tonnage: 75, mech_class: "Heavy", armor_points: 237, structure_points: 123, speed: 65, jump_jets: 3, weapon_slots: 8, missile_slots: 0, energy_slots: 4, ballistic_slots: 2, heat_sinks: 20, engine_rating: 300, tech_base: "Inner Sphere", battle_value: 1456, cost: 8_000_000.0, introduction_year: 2612 },

  # Black Knight - Energy Powerhouse
  { mech_name: "Black Knight", variant: "BL-7-KNT", tonnage: 75, mech_class: "Heavy", armor_points: 231, structure_points: 123, speed: 65, jump_jets: 0, weapon_slots: 8, missile_slots: 0, energy_slots: 8, ballistic_slots: 0, heat_sinks: 20, engine_rating: 300, tech_base: "Inner Sphere", battle_value: 1471, cost: 7_454_725.0, introduction_year: 2578 },
  { mech_name: "Black Knight", variant: "BL-P-KNT", tonnage: 75, mech_class: "Heavy", armor_points: 237, structure_points: 123, speed: 65, jump_jets: 0, weapon_slots: 10, missile_slots: 2, energy_slots: 8, ballistic_slots: 0, heat_sinks: 24, engine_rating: 300, tech_base: "Inner Sphere", battle_value: 1750, cost: 9_000_000.0, introduction_year: 2578 },

  # === ASSAULT MECHS (80-100 tons) ===

  # Awesome - PPC Platform
  { mech_name: "Awesome", variant: "AWS-8Q", tonnage: 80, mech_class: "Assault", armor_points: 232, structure_points: 131, speed: 49, jump_jets: 0, weapon_slots: 6, missile_slots: 0, energy_slots: 6, ballistic_slots: 0, heat_sinks: 28, engine_rating: 240, tech_base: "Inner Sphere", battle_value: 1358, cost: 6_598_170.0, introduction_year: 2665 },
  { mech_name: "Awesome", variant: "AWS-PB", tonnage: 80, mech_class: "Assault", armor_points: 253, structure_points: 131, speed: 49, jump_jets: 0, weapon_slots: 8, missile_slots: 2, energy_slots: 6, ballistic_slots: 0, heat_sinks: 32, engine_rating: 240, tech_base: "Inner Sphere", battle_value: 1750, cost: 9_000_000.0, introduction_year: 2665 },

  # Stalker - LRM Artillery
  { mech_name: "Stalker", variant: "STK-3F", tonnage: 85, mech_class: "Assault", armor_points: 240, structure_points: 139, speed: 49, jump_jets: 0, weapon_slots: 10, missile_slots: 6, energy_slots: 4, ballistic_slots: 0, heat_sinks: 20, engine_rating: 255, tech_base: "Inner Sphere", battle_value: 1558, cost: 6_804_920.0, introduction_year: 2594 },
  { mech_name: "Stalker", variant: "STK-M", tonnage: 85, mech_class: "Assault", armor_points: 269, structure_points: 139, speed: 49, jump_jets: 0, weapon_slots: 10, missile_slots: 4, energy_slots: 4, ballistic_slots: 2, heat_sinks: 24, engine_rating: 255, tech_base: "Inner Sphere", battle_value: 1850, cost: 10_000_000.0, introduction_year: 2594 },

  # Battlemaster - Command Assault
  { mech_name: "Battlemaster", variant: "BLR-1G", tonnage: 85, mech_class: "Assault", armor_points: 240, structure_points: 139, speed: 65, jump_jets: 0, weapon_slots: 8, missile_slots: 2, energy_slots: 6, ballistic_slots: 0, heat_sinks: 20, engine_rating: 340, tech_base: "Inner Sphere", battle_value: 1212, cost: 8_501_244.0, introduction_year: 2633 },
  { mech_name: "Battlemaster", variant: "BLR-1GHE", tonnage: 85, mech_class: "Assault", armor_points: 269, structure_points: 139, speed: 65, jump_jets: 0, weapon_slots: 10, missile_slots: 4, energy_slots: 6, ballistic_slots: 0, heat_sinks: 24, engine_rating: 340, tech_base: "Inner Sphere", battle_value: 1750, cost: 11_000_000.0, introduction_year: 2633 },

  # Cyclops - Command Platform
  { mech_name: "Cyclops", variant: "CP-10-Z", tonnage: 90, mech_class: "Assault", armor_points: 248, structure_points: 147, speed: 54, jump_jets: 0, weapon_slots: 6, missile_slots: 2, energy_slots: 2, ballistic_slots: 2, heat_sinks: 12, engine_rating: 300, tech_base: "Inner Sphere", battle_value: 965, cost: 9_375_360.0, introduction_year: 2710 },
  { mech_name: "Cyclops", variant: "CP-S", tonnage: 90, mech_class: "Assault", armor_points: 285, structure_points: 147, speed: 54, jump_jets: 0, weapon_slots: 8, missile_slots: 2, energy_slots: 2, ballistic_slots: 4, heat_sinks: 18, engine_rating: 300, tech_base: "Inner Sphere", battle_value: 1650, cost: 12_000_000.0, introduction_year: 2710 },

  # Highlander - Jump Sniper
  { mech_name: "Highlander", variant: "HGN-733", tonnage: 90, mech_class: "Assault", armor_points: 256, structure_points: 147, speed: 49, jump_jets: 3, weapon_slots: 8, missile_slots: 2, energy_slots: 4, ballistic_slots: 2, heat_sinks: 13, engine_rating: 270, tech_base: "Inner Sphere", battle_value: 1838, cost: 10_984_230.0, introduction_year: 2592 },
  { mech_name: "Highlander", variant: "HGN-HM", tonnage: 90, mech_class: "Assault", armor_points: 285, structure_points: 147, speed: 49, jump_jets: 5, weapon_slots: 10, missile_slots: 0, energy_slots: 6, ballistic_slots: 2, heat_sinks: 20, engine_rating: 270, tech_base: "Inner Sphere", battle_value: 2100, cost: 14_000_000.0, introduction_year: 2592 },

  # Banshee - Versatile Assault
  { mech_name: "Banshee", variant: "BNC-3E", tonnage: 95, mech_class: "Assault", armor_points: 264, structure_points: 155, speed: 49, jump_jets: 0, weapon_slots: 8, missile_slots: 2, energy_slots: 4, ballistic_slots: 2, heat_sinks: 16, engine_rating: 285, tech_base: "Inner Sphere", battle_value: 1223, cost: 8_400_375.0, introduction_year: 2445 },
  { mech_name: "Banshee", variant: "BNC-SR", tonnage: 95, mech_class: "Assault", armor_points: 299, structure_points: 155, speed: 49, jump_jets: 4, weapon_slots: 10, missile_slots: 2, energy_slots: 6, ballistic_slots: 2, heat_sinks: 24, engine_rating: 285, tech_base: "Inner Sphere", battle_value: 2000, cost: 12_500_000.0, introduction_year: 3047 },

  # Atlas - King of the Battlefield
  { mech_name: "Atlas", variant: "AS7-D", tonnage: 100, mech_class: "Assault", armor_points: 304, structure_points: 163, speed: 54, jump_jets: 0, weapon_slots: 8, missile_slots: 2, energy_slots: 4, ballistic_slots: 2, heat_sinks: 20, engine_rating: 300, tech_base: "Inner Sphere", battle_value: 1557, cost: 9_626_000.0, introduction_year: 2755 },
  { mech_name: "Atlas", variant: "AS7-BH", tonnage: 100, mech_class: "Assault", armor_points: 313, structure_points: 163, speed: 54, jump_jets: 0, weapon_slots: 10, missile_slots: 2, energy_slots: 4, ballistic_slots: 4, heat_sinks: 24, engine_rating: 300, tech_base: "Inner Sphere", battle_value: 1900, cost: 13_000_000.0, introduction_year: 2755 },
  { mech_name: "Atlas", variant: "AS7-KR", tonnage: 100, mech_class: "Assault", armor_points: 313, structure_points: 163, speed: 54, jump_jets: 0, weapon_slots: 10, missile_slots: 2, energy_slots: 4, ballistic_slots: 4, heat_sinks: 26, engine_rating: 300, tech_base: "Inner Sphere", battle_value: 2200, cost: 15_000_000.0, introduction_year: 2755 },

  # King Crab - Ballistic Monster
  { mech_name: "King Crab", variant: "KGC-000", tonnage: 100, mech_class: "Assault", armor_points: 288, structure_points: 163, speed: 43, jump_jets: 0, weapon_slots: 8, missile_slots: 2, energy_slots: 2, ballistic_slots: 4, heat_sinks: 15, engine_rating: 300, tech_base: "Inner Sphere", battle_value: 1509, cost: 9_500_625.0, introduction_year: 2743 },
  { mech_name: "King Crab", variant: "KGC-KJ", tonnage: 100, mech_class: "Assault", armor_points: 313, structure_points: 163, speed: 43, jump_jets: 0, weapon_slots: 10, missile_slots: 2, energy_slots: 2, ballistic_slots: 6, heat_sinks: 20, engine_rating: 300, tech_base: "Inner Sphere", battle_value: 2000, cost: 14_000_000.0, introduction_year: 2743 },

  # Nightstar - Ultra-Heavy
  { mech_name: "Nightstar", variant: "NSR-9J", tonnage: 95, mech_class: "Assault", armor_points: 299, structure_points: 155, speed: 49, jump_jets: 0, weapon_slots: 6, missile_slots: 0, energy_slots: 4, ballistic_slots: 2, heat_sinks: 19, engine_rating: 285, tech_base: "Inner Sphere", battle_value: 1935, cost: 18_634_540.0, introduction_year: 3057 }
]

puts "Creating #{mechs_to_create.length} mechs..."

created_count = 0
failed_count = 0

mechs_to_create.each do |mech_data|
  begin
    # Use find_or_create_by to avoid duplicates
    mech = Mech.find_or_create_by(
      mech_name: mech_data[:mech_name],
      variant: mech_data[:variant]
    ) do |m|
      m.assign_attributes(mech_data)
    end

    if mech.persisted?
      created_count += 1
    end
  rescue => e
    puts "Failed to create #{mech_data[:mech_name]} #{mech_data[:variant]}: #{e.message}"
    failed_count += 1
  end
end

puts "\n🤖 MechWarrior 5 Database Seeded Successfully!"
puts "📊 Total mechs created: #{created_count}"
puts "❌ Failed mechs: #{failed_count}" if failed_count > 0
puts "💾 Total mechs in database: #{Mech.count}"
puts "⚡ Light mechs: #{Mech.where(mech_class: 'Light').count}"
puts "⚖️  Medium mechs: #{Mech.where(mech_class: 'Medium').count}"
puts "🔥 Heavy mechs: #{Mech.where(mech_class: 'Heavy').count}"
puts "💀 Assault mechs: #{Mech.where(mech_class: 'Assault').count}"

puts "\n🎯 Sample queries to try:"
puts "Mech.where(tonnage: 100).order(:battle_value)"
puts "Mech.where(mech_class: 'Assault').where('cost > ?', 10_000_000)"
puts "Mech.where(mech_class: 'Light').average(:speed)"
