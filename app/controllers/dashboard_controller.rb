class DashboardController < ApplicationController
	before_action :authenticate_user!

	def index
		if current_user.admin?
    	@users = User.get_users(current_user.organization)
    else
      flash[:notice] = "Unauthorized Page View"
      redirect_to(tasks_url)
    end
  end
end
