class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    new_user = User.new(user_params)
    if new_user.save
      render json: new_user
    else
      render json: new_user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    user = User.find(params[:id])
    render json: user
  end

  def update
    user = User.find(params[:id])
    user.update_attributes(user_params)
    render json: user
  end

  def destroy
    user = User.find(params[:id])
    user.delete
  end

  def user_params
    params[:user].permit(:name, :email)
  end
end
