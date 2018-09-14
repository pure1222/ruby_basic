class PostsController < ApplicationController

  before_action :admin_user,{only:[:new,:edit,:destroy,:update]}
  
  def index
    @posts = Post.paginate(page: params[:page])
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(content: params[:content],user_id: @current_user.id,title: params[:title],price: params[price])
      if params[:image]
         @post.image_name = "#{@post.id}.jpg"
         image = params[:image]
         File.binwrite("public/post_images/#{@post.image_name}", image.read)
      end
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
      
  end
  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes = Like.where(post_id: params[:id])
  end
  def edit
    @post = Post.find_by(id: params[:id])
  end
  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:content]
    @post.title = params[:title]
    @post.price = params[:price]
    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end
  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy
      flash[:notice] = "投稿を削除しました"
      redirect_to("/posts/index")
    end
  end
end
