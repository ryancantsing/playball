class UsersController < ApplicationController
  def index
    @user = User.new
  end
  def dashboard
    @user = User.find(session[:user_id])
    players = Player.where(user_id: @user.id).uniq.pluck(:team_id)
    @players = Player.where(user_id: @user.id)
    teams = Team.all.pluck(:id)
    @not_on_teams = on_team(players, teams)
    received_messages = Message.where(recipient_id: @user.id)
    @new_messages = received_messages.where(read: false)
    
    if @user
      render 'dashboard'
    else
      flash[:errors] = ["You are not logged in!"]
      redirect_to '/'
    end
  end

  def create
    @user = User.new(user_params)
    @user.save
    if @user.save
      flash[:notice] = ['User successfully created! Please Log In']
      redirect_to '/users/index'
    else
      render 'index'
    end
  end

  def edit
    @user = User.find(session[:user_id])
    if @user
      render 'edit'
    else
      flash[:errors] = ["You are not logged in!"]
      redirect_to '/'
    end
  end
  def update
    user = User.find(session[:user_id])
    user.update(first_name: params['user'][:first_name], last_name: params['user'][:last_name])
    redirect_to '/users/dashboard'
  end

  def login
    user = User.find_by_email(params['user'][:email]).try(:authenticate, params['user'][:password])
    if user
      session[:user_id] = user.id
      redirect_to '/users/dashboard'
    else
      flash[:errors] = ["Invalid Login Information"]
      redirect_to '/users/index'
    end
  end
  def logout
    reset_session
    redirect_to '/users/index'
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
  def on_team(players, teams)
    delete_list = []
    for j in 0..players.length - 1
        for i in 0..teams.length - 1
            if players[j] == teams[i]
                    delete_list.push(teams[i])
            end
        end
    end
    delete_list.each do |del|
        teams.delete_at(teams.index(del))
    end
    return teams
  end

end
