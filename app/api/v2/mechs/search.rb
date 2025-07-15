module Api
  module V2
    module Mechs
      class Search
        prepend SimpleCommandDispatcher::Commands::CommandCallable

        def call
          Mech.by_cost(cost)
            .or(Mech.by_introduction_year(introduction_year))
            .or(Mech.by_mech_name(mech_name))
            .or(Mech.by_tonnage(tonnage))
            .or(Mech.by_variant(variant))
        rescue StandardError => e
          errors.add(:mech_search, e.message)
          []
        end

        private

        def initialize(params = {})
          @cost              = params[:cost]
          @introduction_year = params[:introduction_year]
          @mech_name         = params[:mech_name]
          @tonnage           = params[:tonnage]
          @variant           = params[:variant]
        end

        attr_reader :cost, :introduction_year, :mech_name, :tonnage, :variant
      end
    end
  end
end
