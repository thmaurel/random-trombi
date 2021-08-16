class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profiles = Profile.where(active: true)
  end

  def new
    @profile = Profile.new
  end

  def correct
    @profile = Profile.find(params[:profile_id])
    name = params[:name]
    activity = params[:activity]
    if @profile.name.downcase == name.downcase && @profile.job.downcase == activity.downcase
      render json: {status: "won"}.to_json
    else
      render json: {status: "lost", name: @profile.name, activity: @profile.job}.to_json
    end
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.active = true
    if @profile.save
      flash[:notice] = "Your profile has been saved!"
      redirect_to new_profile_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to profiles_path
    else
      render :edit
    end
  end

  def destroy
    @profile.update(active: false)
    redirect_to profiles_path
  end

  def random
    @profile = Profile.where(active:true).sample
  end

  def submit
    @profile = Profile.find(params[:profile])
    name = @profile.name.downcase == params[:name].downcase
    job = @profile.job.downcase == params[:activity].downcase
    valid = name && job
    if valid
      flash[:notice] = "GG WP bro!"
    else
      flash[:alert] = "Fais un effort pls"
      #flash[:alert] = "Perdu, c'était #{@profile.name} - #{@profile.job}"
      #sleep 4
    end
    # redirect_to random_path
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :job, :photo)
  end
end
