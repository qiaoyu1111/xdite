class Admin::PostsController < ApplicationController
  
  layout 'admin'
  #before_filter :require_is_admin
  #before_filter :find_board
  before_filter :authenticate_user!,:except=>[:index]
  #before_filter :current_user_posts
  
  def edit
    #@board=Board.find(params[:board_id])
    @post=current_user.posts.find(params[:id])
  end
  
  def update
    #@board=Board.find(params[:board_id])
    #@post=current_user.posts.find(params[:id])
    @post=Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(board_post_path(@board,@post),:notice => "成功更新")}    
      else 
        format.html { render :action => "edit"}
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

  
end
