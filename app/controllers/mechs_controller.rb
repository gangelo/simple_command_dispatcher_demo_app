class MechsController < ApplicationController
  before_action :route_request, except: [ :index ]

  def index
    render json: { mechs: Mech.all }
  end

  def search
    # This action is intentionally left empty. The routing is handled by the before_action :route_request.
  end

  private

  def route_request
    command = SimpleCommandDispatcher.call(
      command: request.path,
      command_namespace: nil,
      request_params: params
    )

    if command.success?
      render json: { mechs: command.result }, status: :ok
    else
      render json: { errors: command.errors }, status: :unprocessable_entity
    end
  end
end
