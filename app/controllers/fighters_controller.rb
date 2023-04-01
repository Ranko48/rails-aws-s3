class FightersController < ApplicationController
  def index
    @fighters = Fighter.all
  end
  
  def show
    @fighter = Fighter.find(params[:id])
  end

  def new
    @fighter = Fighter.new
  end
  
  def create
    @fighter = Fighter.new(fighter_params)
    if @fighter.save
      redirect_to @fighter, notice: 'Fighter was successfully created.'
    else
      render :new
    end
  end
  
  def edit
    @fighter = Fighter.find(params[:id])
  end
  
  def update
    @fighter = Fighter.find(params[:id])
    if @fighter.update(fighter_params)
      redirect_to @fighter, notice: 'Fighter was successfully updated.'
    else
      render :edit
    end
  end
  
  def destroy
    @fighter = Fighter.find(params[:id])
    @fighter.destroy
    redirect_to fighters_url, notice: 'Fighter was successfully destroyed.'
  end
  
  private
  
  def fighter_params
    params.require(:fighter).permit(:name, :age, :weight, :professional_record, :city_of_origin, :club)
  end
end
