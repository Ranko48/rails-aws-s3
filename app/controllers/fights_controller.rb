class FightsController < ApplicationController
  before_action :set_fight, only: [:show, :edit, :update, :destroy]

  def index
    @fights = Fight.all
  end

  def show
  end

  def new
    @fight = Fight.new
  end

  def edit
  end

  def create
    @fight = Fight.new(fight_params)

    respond_to do |format|
      if @fight.save
        format.html { redirect_to @fight, notice: 'Fight was successfully created.' }
        format.json { render :show, status: :created, location: @fight }
      else
        format.html { render :new }
        format.json { render json: @fight.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @fight.update(fight_params)
        format.html { redirect_to @fight, notice: 'Fight was successfully updated.' }
        format.json { render :show, status: :ok, location: @fight }
      else
        format.html { render :edit }
        format.json { render json: @fight.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @fight.destroy
    respond_to do |format|
      format.html { redirect_to fights_url, notice: 'Fight was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def fight_fields
    @fight = Fight.new
    @fighters = Fighter.all
    render partial: 'fight_fields', locals: { f: @event_form_builder.fields_for(:fights, @fight, child_index: 'new_fight') }
  end

  private
    def set_fight
      @fight = Fight.find(params[:id])
    end

    def fight_params
      params.require(:fight).permit(:fighter1_id, :fighter2_id, :event_id)
    end
end
