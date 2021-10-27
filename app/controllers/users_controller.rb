class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books.page(params[:page]).reverse_order
  
  end
  
  def index
    @user = User.page(params[:page]).reverse_order
    @books = Book.page(params[:page]).reverse_order
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      render :new
    end
    
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
