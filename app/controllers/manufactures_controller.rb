class ManufacturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_maunufacture, only: [:show, :edit, :update, :destroy]

  def index
    @manufactures = Manufacture.all
  end

  def new
    @manufacture = Manufacture.new
  end

  def create
    @manufacture = current_user.manufactures.build(manufacture_params)
    # @manufacture = Manufacture.new(manufacture_params)
    binding.irb
    if @manufacture.save
      redirect_to manufactures_path, notice: "新規作成したよ"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @manufacture.update(manufacture_params)
      redirect_to manufactures_path, notice: "更新したよ"
    else
      render :edit
    end
  end

  def destroy
    @manufacture.destroy
    redirect_to  manufacture_path, notice: "削除したよ"
  end

  private
  def manufacture_params
    params.require(:manufacture).permit(:harvest, :indoor_temperature, :soil_temperature, :humidity)
  end

  def set_maunufacture
    @manufacture = Manufacture.find(params[:id])
  end
end
