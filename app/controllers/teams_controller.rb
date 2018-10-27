class TeamsController < ApplicationController
  before_action :set_team, only: [:show, :edit, :update, :destroy, :users, :add_user]
  before_action :set_tenant, only: [:show, :edit, :update, :destroy, :new, :create, :users, :add_user]
  before_action :verify_tenant


  def index
    # if current_user
    #   if session[:tenant_id]
    #     Tenant.set_current_tenant session[:tenant_id]
    #   else
    #     Tenant.set_current_tenant current_user.tenants.first
    #   end
    #
    #   @tenant = Tenant.current_tenant
      @teams = Team.by_user_plan_and_tenant(@tenant.id, current_user)
    #   params[:tenant_id] = @tenant.id
    # end
  end


  def show
  end


  def new
    @team = Team.new
  end


  def edit
  end


  def create
    @team = Team.new(team_params)
    @team.users << current_user

    respond_to do |format|
      if @team.save
        format.html { redirect_to root_url, notice: 'Team was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /teams/1
  # PATCH/PUT /teams/1.json
  def update
    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to root_url, notice: 'Team was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team.destroy
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Team was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def users
    @team_users = (@team.users + (User.where(tenant_id: @tenant.id, is_admin: true))) - [current_user]
    @other_users = @tenant.users.where(tenant_id: @tenant.id, is_admin:false) - (@team_users + [current_user])
  end

  def add_user
    @team_user = UserTeam.new(user_id: params[:user_id], team_id: @team.id)

    respond_to do |format|
      if @team_user.save
        format.html { redirect_to users_tenant_team_url(id: @team.id, tenant_id: @team.tenant_id), notice: "User added to team"}
      else
        format.html { redirect_to users_tenant_team_url(id: @team.id, tenant_id: @team.tenant_id), error: "User was not added to team"}
      end
  end

  private
    def set_tenant
      @tenant = Tenant.find(params[:tenant_id])
    end

    def verify_tenant
      unless params[:tenant_id] == Tenant.current_tenant_id.to_s
        redirect_to :root, flash: {error: "You are not authorised to access any orgnanisations other than your own"}
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_params
      params.require(:team).permit(:name, :description, :image_logo, :image_hero, :tenant_id)
    end
end
