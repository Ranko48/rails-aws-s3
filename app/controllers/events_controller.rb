class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
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
      # Loop through each fights attribute from params
      event_params[:fights_attributes]&.each do |key, fight_params|
        # If the fight has an id, update it
        if fight_params[:id].present?
          fight = Fight.find_by(id: fight_params[:id], event_id: @event.id)
          fight.update(fight_params) if fight.present?
        # If the fight has no id, create it
        elsif fight_params[:fighter1_id].present? && fight_params[:fighter2_id].present?
          @event.fights.create(fight_params)
        end
      end
  
      redirect_to event_path(@event), notice: "Event updated successfully."
    else
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
