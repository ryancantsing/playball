class PlayersController < ApplicationController
  def new
    @teams = Team.all 
    render 'new'
  end

  def create
    user_id = session[:user_id]
    player = Player.create(user_id: user_id, team_id: params['player'][:team_id], position: params['player'][:position])
    redirect_to "/teams/#{player.team_id}/view"
  end

  def edit
    @player = Player.find(params[:id])
    render 'edit'
  end

  def update
    player = Player.find(params[:id])
    player.update(params[:position])
    redirect_to "players/#{player.id}/view"
  end

  def delete
    player = Player.find(params[:id])
    player.delete()
  end

  def view
    @player = Player.find(params[:id])
    @team = Team.find(@player.team_id)
    @players = @team.players
    render 'view'
  end
end
