class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
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
    @profile.destroy
    redirect_to profiles_path
  end

  def random
    @profile = Profile.all.sample
  end

  def submit
    @profile = Profile.find(params[:profile])
    name = @profile.name.downcase == params[:name].downcase
    job = @profile.job.downcase == params[:activity].downcase
    valid = name && job
    if valid
      flash[:notice] = "GG WP bro!"
      redirect_to random_path
    else
      flash[:alert] = "Fais un effort pls"
      render :random
    end
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :job, :photo)
  end
end
