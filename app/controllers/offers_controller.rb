class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy] # call the set_offer method for each of the specified methods

  # Listing all offers
  def index
    @offers = Offer.all
  end

  # Showing an offer
  def show
  end

  # HTTP GET for new offer form
  def new
    @offer = Offer.new
    # Class variable, course application to receive offer passed through url query parameter
    @@course_application = CourseApplication.find(params[:course_application])
    # Settting the course application of the offer
    @offer.course_application = @@course_application
    @offer.course_application_id = @@course_application.id
  end

  # HTTP POST for creating a new offer
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
        # JSON format for easy debugging
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # HTTP GET for editing an offer
  def edit
  end

  # HTTP PATCH for updating an offer, generated using rails scaffolding
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

  # Deleting an offer
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to offers_url, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # A student accepting an offer from a college
  def accept
    # Creating offer and saving new status
    @offer = Offer.find(params[:offer])
    @offer.status = "Accepted"
    @offer.save

    # Updating status of application to complete
    @course_application = @offer.course_application
    @course_application.status = "Completed"
    @course_application.save

    # Updating course spaces
    @course = @course_application.course
    @course.decrease_spaces
    @course.save

    # Updating user status having accepted an offer
    @user = @offer.course_application.application.user
    @user.has_accepted_offer = true
    @user.save
  end

  # A student declining an offer from a college
  def decline
    @offer = Offer.find(params[:offer])
    @offer.status = "Declined"
    if @offer.save
      @course_application = @offer.course_application
      @course_application.status = "Declined"
      @course_application.save

      flash[:success] = "Offer has been declined"
      redirect_to user_offers_path
    end
  end

  # When a college rejects an application
  def reject
    @course_application = CourseApplication.find(params[:course_application])
    @course_application.status = "rejected"
    if @course_application.save
        flash[:success] = "Application was rejected"
        redirect_to college_applications_path
    end
  end


  private

    # Retrieving the requested offer
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Whitelisted parameters for an offer
    def offer_params
      params.require(:offer).permit(:offer_type, :details, :college, :course_application)
    end
end
