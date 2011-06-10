class Admin::PostsController < ApplicationController
  
  layout 'admin'
  before_filter :require_is_admin
  before_filter :find_board
  before_filter :authenticate_user!,:except=>[:index]
  #before_filter :current_user_posts
  
  def edit
    #@board=Board.find(params[:board_id])
    #@post=current_user.posts.find(params[:id]),此种写法适合用户，而非管理员
    @post=Post.find(params[:id])
    respond_to do |format|
      format.html {  }
    end
  end
  
  def update
    #@board=Board.find(params[:board_id])
    #@post=current_user.posts.find(params[:id])
    @post=Post.find(params[:id])
    respond_to do |format|
    if @post.update_attributes(params[:post])
        format.html { redirect_to(board_path(@board),:notice => "成功更新")}    
      else 
        format.html { }
      end
    end 
  end 
  
  def destroy

    #@board=Board.find(params[:board_id])
    #@post=current_user.posts.find(params[:id])
    @post=Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to(board_path(@board))}
    end  
  end

  protected
     def find_board
       @board=Board.find(params[:board_id])  
     end
  
end
