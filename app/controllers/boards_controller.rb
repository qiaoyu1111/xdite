class BoardsController < ApplicationController
  def index
    @boards=Board.all
    
    respond_to do |format|
      format.html
    end
  end

  def show
    @board=Board.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def edit
    #@board=Board.new
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
        format.html{redirect_to :controller => "boards", :action => "index",:notice => 'Board was successfully created.'}
      else
        format.html{redirect_to :action => "new"}
      end
    end
   
  end

  def update
    @board=Board.find(params[:id])
    respond_to do |format|
      if @board.update_attributes(params[:board])
        format.html { redirect_to :action => "index",:notice => 'Board was successfully updated.'}
      else 
        format.html { render :action => "edit"}
      end
    end
  
  end

  def destroy
    @board=Board.find(params[:id])
    @board.destroy
    respond_to do |format|
      format.html { redirect_to :action => "index" }
    end
  end
end