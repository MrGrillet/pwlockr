class PasswordsController < ApplicationController
  before_action :set_password, only: [:show, :edit, :update, :destroy]
  before_action :set_tenant, only: [:index, :new, :show, :edit, :update, :destroy, :create]

  def index
    @passwords = Password.all
    @user_passwords = Password.where(team_id: '').where(client_id: '')
  end

  def show
  end

  def new
    @password = Password.new
  end

  def edit
  end

  def create
    @password = Password.new(password_params)
    

    respond_to do |format|
      if @password.save
        format.html { redirect_to @password, notice: 'Password was successfully created.' }
        format.json { render :show, status: :created, location: @password }
      else
        format.html { render :new }
        format.json { render json: @password.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @password.update(password_params)
        format.html { redirect_to @password, notice: 'Password was successfully updated.' }
        format.json { render :show, status: :ok, location: @password }
      else
        format.html { render :edit }
        format.json { render json: @password.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @password.destroy
    respond_to do |format|
      format.html { redirect_to passwords_url, notice: 'Password was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_tenant
      @tenant = Tenant.find(session[:tenant_id])
    end

    def set_password
      @password = Password.find(params[:id])
    end

    def password_params
      params.require(:password).permit(:name, :key, :team_id, :client_id, :tenant_id)
    end
end
