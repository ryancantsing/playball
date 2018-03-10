class GamesController < ApplicationController
  def create
    user_id = session[:user_id]
    game = Game.create(game_params)
    redirect_to "/games/#{game.id}/view"
  end

  def update
    game = Game.find(params[:id])
    game.update(home_id: params[:home_id], away_id: params[:away_id], date: params[:date], details: params[:details])
    redirect_to "/games/#{game.id}/view"
  end

  def newgame
    @teams = Team.all
    render 'newgame'
  end

  def edit
    @game = Game.find(params[:id])
    @teams = Team.all
    @team1 = Team.find(@game.home_id)
    @team2 = Team.find(@game.away_id)
    render 'edit'
  end

  def delete
    game = Game.find(params[:id])
    game.delete()
    redirect_to "/users/dashboard"
  end
  def view
    @game = Game.find(params[:id])
    @team1 = Team.find(@game.home_id)
    @homeplayers = @team1.players
    @coach1 = User.find(@team1.coach_id)
    @team2 = Team.find(@game.away_id)
    @awayplayers = @team2.players
    @coach2 = User.find(@team2.coach_id)

    render 'view'
  end
  private
  def game_params
    params.require(:game).permit(:home_id, :away_id, :date, :details)
  end
end
