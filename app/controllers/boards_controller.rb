class BoardsController < ApplicationController
  
  before_filter :authenticate_user!,:except=>[:index,:show]
  def index
    #@boards=Board.all
    @boards = Board.order(:id).page(params[:page])
    respond_to do |format|
      format.html
    end
  end

  def show
    @board=Board.find(params[:id])
    @posts =@board.posts.order(:id).page(params[:page])
    respond_to do |format|
      format.html
    end
  end



end