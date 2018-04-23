class BulletinsController < ApplicationController
  def create
    user_id = session[:user_id]
    team_id = params['bulletin'][:team_id]
    bulletin = Bulletin.create(team_id: params['bulletin'][:team_id], user_id: user_id, content: params['bulletin'][:content])
    redirect_to "/teams/#{team_id}/view"
  end

  def delete
    bulletin = Bulletin.find(params[:id])
    bulletin.delete()
    redirect_to 'users/dashboard'
  end
end
