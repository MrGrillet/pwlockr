class UserTeamsController < ApplicationController
  before_action :set_user_team, only: [:show, :edit, :update, :destroy]

  def index
    @user_teams = UserTeam.all
  end

  def show
  end

  def new
    @user_team = UserTeam.new
  end

  def edit
  end

  def create
    @user_team = UserTeam.new(user_team_params)

    respond_to do |format|
      if @user_team.save
        format.html { redirect_to @user_team, notice: 'User team was successfully created.' }
        format.json { render :show, status: :created, location: @user_team }
      else
        format.html { render :new }
        format.json { render json: @user_team.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user_team.update(user_team_params)
        format.html { redirect_to @user_team, notice: 'User team was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_team }
      else
        format.html { render :edit }
        format.json { render json: @user_team.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user_team.destroy
    respond_to do |format|
      format.html { redirect_to users_tenant_team_url(id: @user_team.team_id, tenant_id: @user_team.team.tenant_id), notice: 'User team was removed from project' }
      format.json { head :no_content }
    end
  end

  private
    def set_user_team
      @user_team = UserTeam.find(params[:id])
    end

    def user_team_params
      params.require(:user_team).permit(:team_id, :user_id)
    end
end
