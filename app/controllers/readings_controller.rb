require 'twilio-ruby'
class ReadingsController < ApplicationController
  before_action :set_reading, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user! 

  # GET /readings
  # GET /readings.json
  def index
    @user = current_user
    @systolic_range = @user.systolic_range
    @readings = Reading.all
  end

  # GET /readings/1
  # GET /readings/1.json
  def show
  end

  # GET /readings/new
  def new
    @reading = Reading.new
  end

  # GET /readings/1/edit
  def edit
    
  end

  # POST /readings
  # POST /readings.json
  def create
    @user = current_user
    @reading = Reading.new(reading_params)

    respond_to do |format|
      if @reading.save
        format.html { redirect_to user_readings_path, notice: 'Reading was successfully created.' }
        format.json { render :show, status: :created, location: @reading }
          if @reading.systolic > current_user.systolic_range.high || @reading.diastolic < current_user.systolic_range.low
            # Get your Account Sid and Auth Token from twilio.com/user/account
            account_sid = 'AC2fd0b7cc7f2cf2d3e2734452152705c1'
            auth_token = '0f72f16fc1ac47960170fd06a31705cc'
            @client = Twilio::REST::Client.new account_sid, auth_token
   
            message = @client.account.messages.create(:body => "Jenny please?! I love you <3",
                :to => current_user.guardian_phone_number, 
                :from => current_user.phone_number)
            puts message.to
          end
      else
        format.html { render :new }
        format.json { render json: @reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /readings/1
  # PATCH/PUT /readings/1.json
  def update
    respond_to do |format|
      if @reading.update(reading_params)
        format.html { redirect_to user_readings_path, notice: 'Reading was successfully updated.' }
        format.json { render :show, status: :ok, location: @reading }
        if @reading.systolic > 90 || @reading.diastolic > 45
            # Get your Account Sid and Auth Token from twilio.com/user/account
            account_sid = 'AC63de569ccbfd715bed71f1bd6d884215'
            auth_token = '447c2138b017c4bf199553496fab3554'
            @client = Twilio::REST::Client.new account_sid, auth_token
   
            message = @client.account.messages.create(:body => "#{current_user.firstname} #{current_user.lastname}'s blood pressure is outside of normal range",
                :to => current_user.guardian_phone_number, 
                :from => current_user.phone_number)
            puts message.to
          end
      else
        format.html { render :edit }
        format.json { render json: @reading.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /readings/1
  # DELETE /readings/1.json
  def destroy

    @reading.destroy
    respond_to do |format|
      format.html { redirect_to user_readings_path(current_user), notice: 'Reading was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reading
      @user = current_user
      @reading = Reading.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reading_params
      params.require(:reading).permit(:systolic, :diastolic, :heart_rate)
    end
end
