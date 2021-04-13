class PostsController < ApplicationController
  # include concerns Paginable to paging functionality between controls
  include Paginable
  before_action :set_post, only: [:show, :edit, :update, :destroy, :publish]

  # GET /posts
  # GET /posts.json
  def index
    # this method returns a query with 4 records by page
    @posts = paginate(paginate_params[:page], Post)
  end

  # GET /posts/published
  # GET /posts/published.json
  def published
    @posts = Post.published
  end

  # PATCH/PUT /posts/1/publish
  def publish
    # this method to change the state of the post to published
    # set status to published and set published_at with DateTime.current
    @post.publish

    if @post.save
      redirect_to published_posts_path, notice: 'Post published successfully!'
    else
      redirect_to edit_post_path(@post), notice: 'Post unpublished!'
    end
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

  private

  def paginate_params
    params.permit(:page)
  end
  
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
