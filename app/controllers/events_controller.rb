class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @new_event_photo = @event.event_photos.build(params[:event_photo])
  end

  def new
    @fighters = Fighter.all
    @event = Event.new
    @event.fights.build
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to event_path(@event), notice: "Event created successfully."
    else
      @fighters = Fighter.all
      render :new
    end
  end

  def edit
    @fighters = Fighter.all
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
  
    if @event.update(event_params)
      redirect_to event_path(@event), notice: "Event updated successfully."
    else
      Rails.logger.debug "Event update failed. Errors: #{@event.errors.inspect}"
      Rails.logger.debug "Event params: #{event_params.inspect}"
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path, notice: "Event deleted successfully."
  end

  private

  def event_params
    params.require(:event).permit(
      :title,
      :date,
      :location,
      fights_attributes: [:id, :fighter1_id, :fighter2_id, :weight_class, :finished, :_destroy]
    )
  end
end
