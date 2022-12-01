class PostsController < ApplicationController
    def index

        @posts = Post.all
    end
  
    def new
        @posts = Post.new
    end

    def create
        Post.create(post_params)
        redirect_to new_post_path
    end

    def edit
        @post = Post.find(params[:id])
    end

    def show
        @post = Post.find(params[:id])
        redirect_to posts_path
      end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to post_path, notice: "Your meow edited!"
        else
      render :edit
        end
    end

    private
    
    def post_params
        params.require(:post).permit(:content)
    end
end

