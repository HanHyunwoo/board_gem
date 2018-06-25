class PostsController < ApplicationController
  # before_action :authorize, except: [:index]
  before_action :set_post, only: [:show, :edit, :destroy, :update]

  def index
    @posts = Post.all
  end

  def new
  end

  def create
    # post = Post.new
    # post.title = params[:title]
    # post.content = params[:content]
        #post.save
    @post = Post.new(post_params)
    @post.save


    flash[:notice] = "글 작성이 완료되었습니다."
    redirect_to '/'
  end

  def show
    @comments = @post.comments
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to "/posts/#{@post.id}"
  end

  def destroy
    @post.destroy
    redirect_to '/'
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.permit(:title, :content) #.merge(user_id: current_user.id)
  end

end
