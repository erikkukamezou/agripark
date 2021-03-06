class ManufacturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_manufacture, only: [:show, :edit, :update, :destroy]
  before_action :login_user, only: [:edit, :destroy, :update]
  # before_action :set_q, only: [:index, :search]

  def index
    @q = Manufacture.ransack(params[:q])

    @manufactures = @q.result(distinct: true).page(params[:page]).per(10)
    # @manufactures = Manufacture.all.page(params[:page]).per(10)
    # @manufactures = Manufacture.order(:date).select(:date)
    # @manufacture = Manufacture.where
    # Job.order(:day).select(:day)distinct
  end

  def new
    @manufacture = Manufacture.new
  end

  def create
    @manufacture = current_user.manufactures.build(manufacture_params)
    # @manufacture = Manufacture.new(manufacture_params)
    if @manufacture.save
      redirect_to manufactures_path, notice: "新規作成したよ"
    else
      render :new
    end
  end

  def show
    @manufacture_chart = [["収穫量",@manufacture.harvest],["ハウス内の温度",@manufacture.indoor_temperature],
                          ["土の温度",@manufacture.soil_temperature],["湿度",@manufacture.humidity],
                          ["風量",@manufacture.air],["日射量",@manufacture.solar],
                          ["降水量【％】",@manufacture.precipitation],["降水量【ｍ】",@manufacture.precipitation]
                        ]
    # @manufactures = Manufacture.where(date: '10-25').order(:date, :harvest, :indoor_temperature, :soil_temperature, :humidity)
    # @manufacture = Manufacture.where(Manufacture.arel_table[:date].lteq 10-25)
    # @manufacture = Manufacture.where("created_at <= ?", Time.now)
    # Manufacture.where(date: 10-25)
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
    redirect_to  manufactures_path, notice: "削除したよ"
  end

  # def search
  #   # @results = @q.result
  # 　@zoos = Zoo.all
  #   @q = Zoo.ransack(params[:q])
  #   @zoos = @q.result
  #
  # end

  private

  def login_user
    unless Manufacture.find(params[:id]).user.id.to_i == current_user.id
        redirect_to manufactures_path(current_user)
    end
  end

  # def  set_q
  #   @q = Manufacture.ransack(params[:q])
  # end

  def manufacture_params
    params.require(:manufacture).permit(:date, :weather, :atmospheric_temperature, :harvest, :indoor_temperature, :soil_temperature, :humidity, :air, :solar, :precipitation)
  end

  def set_manufacture
    @manufacture = Manufacture.find(params[:id])
  end
end
