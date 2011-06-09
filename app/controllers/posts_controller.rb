class PostsController < ApplicationController
  def index
    @board=Board.find(params[:board_id])
    redirect_to board_path(@board)
  end

  def show
    @board=Board.find(params[:board_id])
    @post=@board.posts.find(params[:id])
  end

  def new
    @board=Board.find(params[:board_id])
    @post=@board.posts.build #new与build的区别是什么？
  end
  
  def edit
    @board=Board.find(params[:board_id])
    @post=@board.posts.find(params[:id])
  end

  def create
    @board=Board.find(params[:board_id])
    @post =Post.new(params[:post])
    @post.board_id=@board.id
    #@post= @board.posts.build(params[:post])
    @post.save
    respond_to do |format|
      format.html { redirect_to(board_path(@board)) }
    end

  end
  
  def update
    @board=Board.find(params[:board_id])
    @post=@board.posts.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(board_post_path(@board,@post),:notice => "成功更新")}    
      else 
        format.html { render :action => "edit"}
      end
    end 
  end 
  
  def destroy

    @board=Board.find(params[:board_id])
    @post=@board.posts.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to(board_path(@board))}
    end  
  end

end
