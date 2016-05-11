class ReferencesController < ApplicationController

  def new
    @reference = Reference.new
    @@application = Application.find(params[:application])
  end

  def create
    @reference = Reference.new(reference_params)
    @@application.referred = true
    @@application.save
    @reference.application = @@application
    @reference.referee = current_referee


    if @reference.save
      flash[:success] = "Reference Added"
      redirect_to referee_applications_path
    else
      render 'new'
    end
  end

  private
  def reference_params
    params.require(:reference).permit(:body, :referee, :application)
  end

end
