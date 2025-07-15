module Api
  module Mechs
    class Destroy
      prepend SimpleCommandDispatcher::Commands::CommandCallable

      def call
        return if failure?

        Mech.find(mech_id)&.destroy
      rescue ActiveRecord::RecordNotFound
        errors.add(:base, "Mech not found")
      rescue StandardError => e
        errors.add(:mech_destroy, e.message)
      end

      private

      def initialize(params = {})
        @mech_id      = params[:mech_id]
        @current_user = params[:current_user]

        authorize_user
        validate_params unless failure?
      end

      attr_reader :current_user, :mech_id

      def authorize_user
        return if MechPolicy.new(current_user, Mech).destroy?

        raise UnauthorizedError
      end

      def validate_params
        errors.add(:base, "Parameter :mech_id is required") if mech_id.blank?
        errors.add(:base, "Parameter :current_user is required") unless current_user.present?
      end
    end
  end
end
