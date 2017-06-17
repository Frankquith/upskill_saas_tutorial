class ProfilesController < ApplicationController
  
  # GET to /users/:user_id/profile/new
  def new
    # Render blank profile details form
    @profile_form = Profile.new
  end
  
  def create
    @profile = Profile.new(profile_params)
  end
  
  private
    def profile_params
      params.require(:profile).permit()
    end
end