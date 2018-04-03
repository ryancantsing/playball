class TeamsController < ApplicationController
  def create
    user_id = session[:user_id]
    @team = Team.create(coach_id: user_id, name: params['team'][:name], password: params['team'][:password])
    redirect_to "/teams/#{@team.id}/view"
  end

  def new
  end

  def update
    team = Team.find(params[:id])
    team.update(name: params['team'][:name])
    redirect_to "/teams/#{team.id}/view"
  end

  def edit
    @team = Team.find(params[:id])
    render 'edit'
  end

  def view
    @id = params[:id]
    @player = Player.find(user_id: session[:user_id])
    @teams = Team.all
    @team = Team.find(params[:id])
    games = Game.where("home_id = #{@id} or away_id = #{@id}").order(date: :asc)
    @schedule = games.where(:home_confirm => true, :away_confirm => true)
    @bulletins = Bulletin.where(team_id: @team.id).order(created_at: :desc)
    @players = @team.players
    render 'view'
  end
end
