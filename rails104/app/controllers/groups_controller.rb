class GroupsController < ApplicationController
before_action :authenticate_user! ,only: [:new,:create ,:edit]
def index
  @groups= Group.all
end

def new
  @group=Group.new
end

def create
   @group=Group.new(group_params)
   @group.user=current_user
   if @group.save
     redirect_to groups_path
   else
    render :new
  end
end

def show
  @group=Group.find(params[:id])
end

def edit
 @group=Group.find(params[:id])
end
def update
  @group=Group.find(params[:id])
  @group.user=current_user
  if @group.update(group_params)
  flash[:notice] = "Group update success"
  redirect_to groups_path,notice: "update success"
else
  render :edit
end

end

def destroy
    @group=Group.find(params[:id])
    @group.destroy
    flash[:alert] = "Group deleted"
    redirect_to groups_path,Noitc:"delete success"
end
private
def group_params
  params.require(:group).permit(:title, :description)
end

end
