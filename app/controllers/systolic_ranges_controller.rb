class SystolicRangesController < ApplicationController
	before_action :set_systolic_range, only: [:show, :edit, :update, :destroy]
  	before_action :authenticate_user! 
 
  def index
  end 

  def show
  end

  def create
  	@systolic_range = SystolicRange.new(systolic_range_params)
  	respond_to do |format|
      if @systolic_range.save
        format.html { redirect_to user_readings_path(current_user), notice: 'Systolic Range was successfully created.' }
        format.json { render :show, status: :created, location: @systolic_range }
      else
        format.html { render :new }
        format.json { render json: @systolic_range.errors, status: :unprocessable_entity }
      end
  	end
  end

  def edit
  	@systolic_range = SystolicRange.find(params[:id])
  end

  def update
  	respond_to do |format|
      if @systolic_range.update(systolic_range_params)
        format.html { redirect_to user_readings_path(current_user), notice: 'systolic_range was successfully updated.' }
        format.json { render :show, status: :ok, location: @systolic_range }
      else
        format.html { render :edit }
        format.json { render json: @systolic_range.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_systolic_range
      @user = current_user
      @systolic_range = SystolicRange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def systolic_range_params
      params.require(:systolic_range).permit(:user_id, :low, :medium, :high)
    end
end
