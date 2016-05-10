class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]

  def index
    @offers = Offer.all
  end

  def show
  end

  def new
    @offer = Offer.new
    # Class variable, course application to receive offer passed through url query parameter
    @@course_application = CourseApplication.find(params[:course_application])
    # Settting the course application of the offer
    @offer.course_application = @@course_application
    @offer.course_application_id = @@course_application.id
  end

  def create
    @offer = Offer.new(offer_params)
    @offer.college = current_college
    # Using class variable to set the course application of the created offer
    @offer.course_application = @@course_application

    respond_to do |format|
      if @offer.save
        format.html { redirect_to @offer, notice: 'Offer was successfully created.' }
      else
        format.html { render :new }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end


  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def accept
    # Creating offer and saving new status
    @offer = Offer.find(params[:offer])
    @offer.status = "Accepted"
    @offer.save

    # Updating status of application to complete
    @course_application = @offer.course_application
    @course_application.status = "Completed"
    @course_application.save

    # Updating user status having accepted an offer
    @user = @offer.course_application.application.user
    @user.has_accepted_offer = true
    @user.save
  end

  private

    def set_offer
      @offer = Offer.find(params[:id])
    end

    def offer_params
      params.require(:offer).permit(:offer_type, :details, :college, :course_application)
    end
end
