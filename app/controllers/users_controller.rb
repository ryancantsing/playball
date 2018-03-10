class UsersController < ApplicationController
  def index
  end
  def dashboard
    @user = User.find(session[:user_id])
    @players = Player.where(user_id: @user.id)
    if @user
      render 'dashboard'
    else
      flash[:errors] = ["You are not logged in!"]
      redirect_to '/'
    end
  end

  def create
    user = User.create(user_params)
    if user.valid? == true
      flash[:notice] = ['User successfully created! Please Log In']
      redirect_to '/users/index'
    else
      flash[:errors] = ["Invalid Registration information!"]
      redirect_to '/users/main'
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
    params.require(:user).permit(:first_name, :last_name, :email, :image, :password)
  end
end
