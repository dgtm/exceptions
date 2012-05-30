class UsersController < ActionController::Base

  def index
    @users = User.all
  end

  def show
    @user = User.find(params['id'])
    @user.raise_exception
  end

  def new
    @user = User.new
  end

  def create
    binding.pry
    @user = User.new(params[:user])
    @user.save
    redirect_to users_path
  end
end
