class ProfilesController < ApplicationController
  before_filter :authenticate_user!

  def dashboard
    @user = User.find(current_user.id)
    if @user.role? :admin
      redirect_to admin_path, :notice => "May the force be with you!"
    else
      respond_to do |format|
        format.html # dashboard.html.erb
      end
    end
  end

end
