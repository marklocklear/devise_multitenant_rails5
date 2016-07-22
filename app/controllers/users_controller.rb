class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!

	def new
		@user = User.new
	end

	def create
    @user = User.new(user_params)
    @user.organization = current_user.organization
    if @user.save
      flash[:notice] = "Successfully created User." 
      redirect_to dashboard_index_path
    else
      render :action => 'new'
    end
  end

	def edit
    #TODO only admins of current_organization should be able to edit users in that organization
	end

  def update
    params[:user].delete(:password) if params[:user][:password].blank?
    params[:user].delete(:password_confirmation) if params[:user][:password].blank? and params[:user][:password_confirmation].blank?
    if @user.update_attributes(user_params)
      flash[:notice] = "Successfully updated User."
      redirect_to dashboard_index_path
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to root_path
    end
  end

	private
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
    	:organization_id, :role, organization_attributes: [:name])
  end
end