class ReferencesController < ApplicationController

  # HTTP GET for new reference form
  def new
    @reference = Reference.new
    # Set the references application through a passed in query parameter
    @@application = Application.find(params[:application])
  end

  # HTTP POST for creating a new reference
  def create
    @reference = Reference.new(reference_params)
    @@application.referred = true # update application be referred
    @@application.save
    @reference.application = @@application # set the application the reference should be attached to
    @reference.referee = current_referee # set referee of the reference

    # If the reference is saved go back to the applications for that referee
    if @reference.save
      flash[:success] = "Reference Added"
      redirect_to referee_applications_path
    else
      render 'new'
    end
  end

  private
  # Whitelisted parameters for a reference
  def reference_params
    params.require(:reference).permit(:body, :referee, :application)
  end

end
