class ProfilesController < ApplicationController
  before_action :authenticate_user! # , only: [:new, :edit] 
  before_action :only_current_user
  
  # GET to /users/:user_id/profile/new
  def new
    # Render blank profile details form
    @profile_form = Profile.new
  end
  
  # POST to /users/:user_id/profile 
  def create
    # Ensure we have the user who is filling out form
    @user = User.find( params[:user_id] )
    # Create profile linked to this specific user
    @profile = @user.build_profile( profile_params )
    @profile.save
    if @profile.save
      flash[:success] = "Profile updated!"
      redirect_to user_path(id: params[:user_id] )
    else
      render action: :new
    end
  end
  
  # GET to /users/:user_id/profile/edit
  def edit
    @user = User.find( params[:user_id])
    @profile_form = @user.profile
  end
  
  # PUT or PATCH to /users/:user_id/profile
  def update
    # Retrieve the user from the database
    @user = User.find( params[:user_id] )
    # Retrieve that user's profile
    @profile = @user.profile
    # Mass assign edit profile attributes and save
    if @profile.update_attributes( profile_params )
      flash[:success] = "Profile updated!"
      redirect_to user_path(id: params[:user_id] )
    else
      render action: edit
    end
    
  end
  
  private
    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :avatar, :job_title, :phone_number, :contact_email, :description)
    end
    
    def only_current_user
      @user = User.find( params[:user_id] )
      redirect_to(root_path) unless @user == current_user
    end
end