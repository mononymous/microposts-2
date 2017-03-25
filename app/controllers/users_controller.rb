class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update]
  before_action :correct_user, only: [:edit, :update]
  def new
    @user = User.new
  end
  
  def show # 追加
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
  end

  def update
    validates  :profile, length: { maximum: 50 }, on: :update
      
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,
                                 :region, :profile)
  end
  
  def set_user
    @user = User.find(params[:id])
  end
  
  def correct_user
    # 編集対象のユーザーは？  @user
    
    # 編集しようとしているユーザーは？  current_user
    # @user == current_user >> ok
    # @user != current_user >> ng
    redirect_to root_path if @user != current_user
  end
end