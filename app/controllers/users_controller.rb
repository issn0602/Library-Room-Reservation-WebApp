class UsersController < ApplicationController
  before_action :set_user, only:[:edit]
  #before_action :correct_user,only: [:edit, :update]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new_user
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create_user
    @user = User.new(user_params)
    @user.role = 'user'

    if @user.save
      log_in @user
      redirect_to '/user/home', notice: @user.name + ', your account has been created. :-)'
    else
      render 'new_user'
    end
  end

  # GET /users/1/edit
  def edit
  end

  def edit_profile
    @user = User.find(params[:id])
  end

  def new_admin
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create_admin
    @user = User.new(user_params)
    @user.role = 'admin'

    if @user.save
      redirect_to @user, notice: 'account for ' + @user.name + ' has been created. :-)'
    else
      render 'new_admin'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def update_profile
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to '/' + @user.role + '/home'
      #redirect_to '/'+ @user.role +'/home'
    else
      render 'edit_profile'
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    User.find(params[:id]).destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password,:password_confirmation)
    end

  # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

end
