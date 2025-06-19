class RatingsController < ApplicationController
  def index
    ratings = Rating.where(exercise_id: params[:exercise_id])
    render json: ratings
  end

  def create
    rating = Rating.new(rating_params.merge(user_id: current_user.id))
    if rating.save
      render json: rating
    else
      render json: { errors: rating.errors.full_messages }, status: 422
    end
  end

  def update
    rating = Rating.find_by(user_id: current_user.id, exercise_id: params[:exercise_id])
    if rating&.update(value: params[:value])
      render json: rating
    else
      render json: { errors: "Rating not found or invalid" }, status: 422
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:exercise_id, :value)
  end
end
