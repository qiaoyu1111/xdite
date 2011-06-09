class PostsController < ApplicationController
  def index
    @posts=Post.all
  end

  def show
    @post=Post.find(params[:id])
  end

  def new
    @post=Post.new
  end
  
  def edit
    @post=Post.find(params[:id])
  end

  def create
    @post=Post.new(params[:post])
    respond_to do |format|
      if @post.save
        #format.html {redirect_to :action => "show", :id => @post.id,:notice => "成功创建" } 输出不了notice这个参数
        format.html {redirect_to(@post,:notice => "成功创建" )}
        else 
        format.html { redirect_to :action => "new" }
      end
    end
  end
  
  def update
    @post=Post.find(params[:id])
    respond_to do |format|
      if @post.update_attributes(params[:post])
          format.html { redirect_to(@post,:notice => "成功更新")}
        else
          format.html { redirect_to :action => "update"}             
      end    

    end

  
  end 
  
  def destroy
    @post=Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to(@post) }
    end
          
  end
    
end
