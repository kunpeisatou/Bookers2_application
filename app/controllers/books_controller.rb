class BooksController < ApplicationController
  def new
     @post_image = Book.new
  end

  def create
    @post_image = Book.new(book_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to books_path
    else
      render :new
    end
    
  end

  def index
    #@post_images = PostImage.allを削除。左記の場合全ての画像を表示してしまうため。
    @post_images = Book.page(params[:page]).reverse_order
  end

  def show
    @post_image = Book.find(params[:id])
  end

  def destroy
    @post_image = Book.find(params[:id])
    @post_image.destroy
    redirect_to books_path
  end
  
  # 投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
