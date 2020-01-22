class UsersController < ApplicationController
  def show

    @user = User.find(params[:id])
    @book1 =@user.books
    @book = Book.new
    @user.profile_image = "default_icon.jpg"

  end

  def edit

    @user = User.find(params[:id])
    @users = User.all
    if @user!= current_user
      redirect_to current_user
    end
  end
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    if @user.save
      flash[:notice] = "You have updated user successfully"
      redirect_to user_path(@user.id)

    else
      render :edit

    end
    if @user!= current_user
      redirect_to users_path
    end
  end
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
    
    @user.profile_image = "default_icon.jpg"
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction,:profile_image)
  end

end
