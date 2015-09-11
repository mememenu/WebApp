class Api::V1::TrackedEventsController < Api::V1::BaseController
  def create
    if event = TrackedEvent.create(permitted_params)
      head :ok
    else
      render json: event.errors, status: :ok
    end
  end

  private

  def permitted_params
    params.require(:tracked_event).permit(:kind, :eventable_id, :eventable_type, :ip)
  end
end
