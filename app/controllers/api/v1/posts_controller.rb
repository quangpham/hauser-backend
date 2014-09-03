module Api
  module V1
    class PostsController < ApplicationController
      # GET /posts
      # GET /posts.json
      def index
        # @posts = Post.where("user_id = ?", current_user.id)
        # authorize @posts
        # render json: @posts
        render json: Post.all
      end

      # GET /posts/1
      # GET /posts/1.json
      def show
        @post = Post.find(params[:id])
        authorize @post
        render json: @post
      end

      # POST /posts
      # POST /posts.json
      def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        authorize @post
        if @post.save
          # render json: @post, status: :created, location: @post
          render json: @post, status: :created
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /posts/1
      # PATCH/PUT /posts/1.json
      def update
        @post = Post.find(params[:id])
        authorize @post
        if @post.update(params[:post])
          head :no_content
        else
          render json: @post.errors, status: :unprocessable_entity
        end
      end

      # DELETE /posts/1
      # DELETE /posts/1.json
      def destroy
        @post = Post.find(params[:id])
        authorize @post
        @post.destroy
        head :no_content
      end

      private
      def post_params
        params.require(:post).permit(:title, :body)
      end
    end
  end
end