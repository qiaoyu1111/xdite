class Admin::BoardsController < ApplicationController
  
  layout 'admin'
  before_filter :require_is_admin
  before_filter :authenticate_user!,:except=>[:index,:show]

  def index
    redirect_to(boards_path)
  end

  def edit
    @board=Board.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    @board=Board.new
    respond_to do |format|
      format.html {  }
    end
    
  end
  
  def create
    @board=Board.new(params[:board])
    respond_to do |format|
      if @board.save
        format.html{redirect_to (board_path(@board),:notice => 'Board was successfully created.')}
      else
        format.html{redirect_to(boards_path)}
      end
    end
   
  end

  def update
    @board=Board.find(params[:id])
    respond_to do |format|
      if @board.update_attributes(params[:board])
        format.html { redirect_to(boards_path,:notice => 'Board was successfully updated.')}
      else 
        format.html { render :action => "edit"}
      end
    end
  
  end

  def destroy
    @board=Board.find(params[:id])
    @posts=@board.posts
    @posts.each do |post|
      post.destroy
    end
    @board.destroy 
    respond_to do |format|
      format.html { redirect_to(boards_path) }
    end
  end
end