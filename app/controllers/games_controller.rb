class GamesController < ApplicationController
  before_action :set_game, only: [:random, :show, :submit]
  def create
    @game = Game.create(score: 0, round: 3, current_round: 1)
    redirect_to random_game_path(@game)
  end

  def random
    @profile = Profile.all.sample
  end

  def show
  end

  def submit
    @profile = Profile.find(params[:profile])
    name = @profile.name.downcase == params[:name].downcase
    job = @profile.job.downcase == params[:activity].downcase
    valid = name && job
    if valid
      @game.score += 1
      flash[:notice] = "GG WP bro!"
    else
      flash[:alert] = "Fais un effort please"
    end
    @game.current_round += 1
    @game.save
    if @game.current_round <= @game.round
      redirect_to random_game_path
    else
      redirect_to game_path(@game)
    end
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end
end
