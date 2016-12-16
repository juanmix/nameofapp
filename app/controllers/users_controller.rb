class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy] # inserted during...
  #..scaffolding. 'callback' method. 'before_action' is a filter. before any...
  #..action is run, call the method 'set_user'. the next parameter means that..
  #..it should only be run for the actions inside that array: show, edit, etc.
  # this callback is here for DRY; each action requieres that user object,..
  #..using a callback prevents us from having to repeat this Active Record query..
  #..inside multiple methods.

  before_action :authenticate_user!, :except => [:show, :index] # restrict access
  #...if not logged in. 'except:' is an exception created for 'index' action.
  # so people can see all the users of your app without logging in.

  load_and_authorize_resource # cancancan helper method. will find user, set the @user...
  #..variable, and check their abilities to make sure they're authorized...
  #..to perform that action (ability to perform read, create, update...).


  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # this method takes the ID parameter and fetches a user record fro that DB, and..
    #..sets the @user variable.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end
end
