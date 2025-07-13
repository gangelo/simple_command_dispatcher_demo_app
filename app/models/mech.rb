class Mech < ApplicationRecord
  scope :by_mech_name, ->(name) {
    name.present? ? where("mech_name ILIKE ?", "%#{name}%") : none
  }

  scope :by_variant, ->(variant) {
    variant.present? ? where("variant ILIKE ?", "%#{variant}%") : none
  }

  scope :by_tonnage, ->(tonnage) {
    tonnage.present? ? where(tonnage: tonnage) : none
  }

  scope :by_cost, ->(cost) {
    cost.present? ? where(cost: cost) : none
  }

  scope :by_introduction_year, ->(year) {
    year.present? ? where(introduction_year: year) : none
  }
end
