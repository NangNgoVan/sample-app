class RelationshipsController < ApplicationController
  before_action :logged_in_user

  def index
    type = params[:type]
    @title = type
    user = User.find_by id: params[:id]
    @users = user.send(type).paginate page: params[:page]
    render "users/show_follow"
  end

  def create
    user = User.find_by id: params[:followed_id]
    current_user.follow user
    redirect_to user
  end

  def destroy
    user = Relationship.find_by(id: params[:id]).followed
    current_user.unfollow user
    redirect_to user
  end
end
