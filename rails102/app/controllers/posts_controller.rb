class PostsController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create]
  before_action :find_post_and_check_premission, only: [:edit, :update, :destroy]

  def index
      @group = Group.find(params[:group_id])
      @posts=@group.posts.all
    end
  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end

  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.group = @group
    @post.user = current_user

    if @post.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end


def edit
  @group = Group.find(params[:group_id])
end

def update

   if @post.update(post_params)

  redirect_to group_path(@group),notice: "Update success"
else
  render :edit
end
end

def destroy
@group = Group.find(params[:group_id])
@post=Post.find(params[:id])
@post.group=@group
  @post.destroy

 flash[:alert] ="post deleted"
  redirect_to account_posts_path

end

  private
  def find_post_and_check_premission
  @group=Group.find(params[:group_id])
  #@post.group=@group
  @post=Post.find(params[:id])
  if current_user !=@post.user
    redirect_to root_path ,alert: "you have not permission"
  end
  end


  def post_params
    params.require(:post).permit(:content)
  end

end
