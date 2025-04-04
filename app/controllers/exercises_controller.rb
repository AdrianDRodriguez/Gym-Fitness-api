class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
    render :index
  end

  def show
    @exercise = Exercise.find_by(id: params[:id])
    render :show
  end

  def create
    @exercise = Exercise.new(
      name: params[:name],
      description: params[:description],
      image_url: params[:image_url],
      video_url: params[:video_url]
    )
    @exercise.save
    render :show
  end

  def update
    @exercise = Exercise.find_by(id: params[:id])
    @exercise.update(
      name: params[:name] || @exercise.name,
      description: params[:description] || @exercise.description,
      image_url: params[:image_url] || @exercise.image_url,
      video_url: params[:video_url] || @exercise.video_url
    )
    @exercise.save
    render :show
  end

  def destroy
    @exercise = Exercise.find_by(id: params[:id])
    @exercise.destroy
    render json: { message: "Exercise eliminated" }
  end
end
