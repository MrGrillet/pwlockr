class MembersController < ApplicationController
  before_action :set_tenant, only: [:index, :new, :show, :edit, :update, :destroy, :dashboard]


  # uncomment to ensure common layout for forms
  # layout  "sign", :only => [:new, :edit, :create]

  def new()
    @member = Member.new()
    @user   = User.new()
  end

  def create()
    @user   = User.new( user_params )

    # ok to create user, member
    if @user.save_and_invite_member() && @user.create_member( member_params )
      flash[:notice] = "New member added and invitation email sent to #{@user.email}."
      redirect_to root_path
    else
      flash[:error] = "errors occurred!"
      @member = Member.new( member_params ) # only used if need to revisit form
      render :new
    end

  end

  def dashboard
    @user_passwords = Password.where(tenant_id: @tenant)
    @teams = Team.where(tenant_id: @tenant)
    @passwords = Password.all
    @clients = Client.all
  end

  def activity
  end

  def show
    @user = params[:id]
  end


  private
  def set_tenant
    @tenant = Tenant.find(session[:tenant_id])
  end

  def member_params()
    params.require(:member).permit(:first_name, :last_name)
  end

  def user_params()
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
