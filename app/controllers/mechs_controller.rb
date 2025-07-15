class MechsController < ApplicationController
  before_action :route_request, except: [ :destroy, :index ]

  def index
    render json: { mechs: Mech.all }
  end

  def search
    # This action is intentionally left empty. The routing is handled by the before_action :route_request.
  end

  def destroy
    command = SimpleCommandDispatcher.call(
      command: action_name,
      command_namespace: [ :api, controller_name ],
      request_params: destroy_params.merge(current_user: current_user)
    )

    if command.success?
      render json: { mech: command.result }, status: :ok
    else
      render json: { errors: command.errors }, status: :unprocessable_entity
    end
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

  def destroy_params
    params.permit(:mech_id)
  end
end
