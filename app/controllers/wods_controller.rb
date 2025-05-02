class WodsController < ApplicationController
  def index
    @wods = Wod.where(user_id: current_user.id)
    render :index
  end

  def show
    @wod = Wod.find_by(id: params[:id])
    render :show
  end

  def create
    @wod = Wod.new(
      user_id: current_user.id,
      exercise_id: params[:exercise_id],
      reps: params[:reps],
    )
    @wod.save
    render :show
  end

  def update
    @wod = Wod.find_by(id: params[:id])
    @wod.update(
      user_id: params[:user_id] || @wod.user_id,
      exercise_id: params[:exercise_id] || @wod.exercise_id,
      reps: params[:reps] || @wod.reps
    )
    @wod.save
    render :show
  end

  def destroy
    @wod = Wod.find_by(id: params[:id])
    @wod.destroy
    render json: { message: "WOD eliminated" }
  end
end
