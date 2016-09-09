class CareersController < ApplicationController
  before_action :find_career, only: [:show, :edit, :update, :destroy]
  def index
    @careers = Career.all
  end

  def new
    @career = Career.new
  end

  def create
    @career = Career.new(career_params.merge(user_id: current_user.id))
    return redirect_to careers_path if @career.save
    render :new
  end

  def update
    return redirect_to careers_path if @career.update(career_params)
    render :edit
  end

  def destroy
    @career.destroy
    redirect_to career_path, notice: 'Career was successfully destroyed'
  end

  private

  def find_career
    @career = Career.find(params[:id])
  end

  def career_params
    params.require(:career).permit(
      :race, :distance, :race_number, :result, :net_result, :rank, :category_rank, :year,
      :event_id, :city, :distance_id
    )
  end
end
