class Admin::UsersController < ApplicationController
  before_action :admin_user
  before_action :set_user, only: [:show, :edit, :destroy, :update]

  def index
    @users = User.all
  end

  def new
    @user =User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "ユーザー「#{@user.name}」を登録したよー"
    else
      render :new
    end
  end

  def show

  end

  def edit
    # @user =User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "更新したよ"
    else
      render :edit
    end
  end


  def destroy
    # @user = User.new(user_params)
    if @user.destroy
      redirect_to admin_users_path, notice: "削除したよ"

    else
      redirect_to admin_users_path, notice: "管理者がいなくなるよ！ #{@user.name} を削除できません！"
    end
  end

  def confirm
    @user = User.new(user_params)
  end

  private
  def admin_user
    unless current_user.admin?
      redirect_to users_path, notice: "あなたは管理者ではありません"
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :admin)
  end
end
