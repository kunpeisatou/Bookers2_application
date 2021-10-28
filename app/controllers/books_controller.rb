class BooksController < ApplicationController
  def new
     @book = Book.new
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

  def index
    #@post_images = PostImage.allを削除。左記の場合全ての画像を表示してしまうため。
    @books = Book.page(params[:page]).reverse_order
    @user = User.page(params[:page]).reverse_order
  end

  def show
    @book = Book.find(params[:id])
    @user = User.find(params[:id])
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
