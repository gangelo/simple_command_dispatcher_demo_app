# frozen_string_literal: true

module Api
  module V1
    module Mechs
      class Search
        prepend SimpleCommandDispatcher::Commands::CommandCallable

        def call
            Mech.by_mech_name(mech_name)
        rescue StandardError => e
          errors.add(:mech_search, e.message)
          []
        end

        private

        def initialize(params = {})
          @mech_name = params[:mech_name]
        end

        attr_reader :mech_name
      end
    end
  end
end
