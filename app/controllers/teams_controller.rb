class TeamsController < ApplicationController
  def create
    user_id = session[:user_id]
    team = Team.create(coach_id: user_id, name: params['team'][:name], sport: params['team'][:sport])
    redirect_to "/teams/#{team.id}/view"
  end

  def new
  end

  def update
    team = Team.find(params[:id])
    team.update(name: params[:name])
    redirect_to "/teams/#{team.id}/view"
  end

  def edit
    @team = Team.find(params[:id])
    render 'edit'
  end

  def view
    @team = Team.find(params[:id])
    @home_games = Game.where(home_id: @team.id)
    @away_games = Game.where(away_id: @team.id)
    @bulletins = Bulletin.where(team_id: @team.id)
    @players = @team.players
    render 'view'
  end
end
