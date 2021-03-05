class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :publish]

  # Authenticate with basic http request before every other action except index, published and show
  before_action :authenticate, except: [:index, :published, :show]

  # Set page param before published action
  before_action :set_page, only: [:published]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/published
  # GET /posts/published.json
  def published
    # TODO: create scopes for @posts and @has_next
    @posts = Post.published(@page, POSTS_PER_PAGE)
    @has_next = Post.published(@page + 1, POSTS_PER_PAGE).any?
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # PATCH /posts/1/published
  # PATCH /posts/1/published.json
  def publish
    # Updates published_at with current datetime
    @post.publish
    respond_to do |format|
      format.html { redirect_to published_posts_url, notice: "Post was successfully published." }
      format.json { render :show, status: :ok, location: @post }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body, :created_at, :published_at)
  end

  # Basic http request with credentials "editor:4dm1n"
  def authenticate
    authenticate_or_request_with_http_basic do |user, passwd|
      user = "editor" && passwd = "4dm1n"
    end
  end

  def set_page
    @page = params[:page] ? params[:page].to_i : 1
  end
end
