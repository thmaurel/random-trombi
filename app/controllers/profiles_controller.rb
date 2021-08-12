class ProfilesController < ApplicationController
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
    @profile = Profile.find(params[:id])
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

  def profile_params
    params.require(:profile).permit(:name, :job, :photo)
  end
end
