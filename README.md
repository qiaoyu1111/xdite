7天学会Rails3
----
day1(2011-6-9):   v0.0.1;v0.0.2;v0.0.3;v0.0.4  
day2(2011-6-10):  v0.0.5;v0.0.6;V0.0.7  
day3(2011-6-11):  v0.0.8;v0.0.9;v0.1.0  
day4(2011-6-12):  v0.1.1;v0.1.2;v0.1.3  
day5(2011-6-13):  [blog](http://www.yangzhiping.com/tech/7days-learn-rails3.html)

前因
----
一位来自台湾的活跃女程序员xdite，最近写了两篇博客。其一，[人生只要70分](http://blog.xdite.net/?p=2270)；其二，[出书的故事](http://blog.xdite.net/?p=2315)

看完之后,颇有感觉.于是,购买了她的这本电子书,也做了一个实验.用7天教与学会Rails3.

在她出版的这本电子书基础上,撰写了本文档，记录了一些教与学的实验细节.以供对Rails感兴趣的人来学习Ruby与Rails.

7天学会Rails3不是嚼头,实际上,只用了三天时间.但是在7天入门之后,你要花费700天来实践.

简单使用说明
----
##1.购买xdite的书##

　　[第一次学Rails就上手](http://blog.xdite.net/?p=2301)

##2.开始练习##

参照xdite提出的题目进行练习,练习之前最好先别看她的章节具体内容.按照自己的理解往下走.走不下去了,再回头来看章节具体内容.如果练习时碰到地雷或者一些问题,可以查阅本文档以及[对照版本库查阅](https://github.com/cngithub/xdite).

##3.反复查书##

[7天学会Rails3的豆列](http://book.douban.com/doulist/1222802/)

##4.学习环境##

Ｍac+TextMate+iTerm

##5.代码评论与排雷##

##5.更多参考##

　　[如何学习ruby and rails杂谈](http://www.yangzhiping.com/tech/Learn-to-Program.html)

　　[在snow Leopard上搭建ree+nginx+passenger的rails3环境](http://www.yangzhiping.com/tech/ree-nginx-passenger-rails3.html)

　　[Rails新手入门培训](http://www.yangzhiping.com/tech/rails-start.html) 

　　[Git与Github入门资料](http://www.yangzhiping.com/tech/git.html) 

　　[Ruby on Rails 实战圣经](http://ihower.tw/rails3/) 

　　[第一次学Rails就上手](http://blog.xdite.net/?p=2301)


版本说明
----
##v0.0.1: hello world##

###地雷###

powder安装可能需要快速宽带(网速过慢会报错)与重启电脑(主要是在之前使用vpn等代理工具的情况下)

###地雷###

增加rvmrc文件，避免使用rvm进行多版本管理时，应用无法启动

###技巧###

将page改为pages，使用rails destroy controller page删除page相关的控制器。

###技巧###

	* git tag -l  #列出当前git tag 
	* git remote rename xdite1 xdite #重命名远程git
	* git push xdite :work1 #删除xdite下面的work1 tag 分支
	* git tag -d work1 #删除本地的work tag 分支

##v0.0.2: 手动撰写CRUD##

###地雷###

增加返回按钮链接。修正confirm大写错误。(javescript严格区分大小写)

###地雷###

比如在连接具体的show页面的时候，请使用liai+tab而不是使用lia+tab; 

###地雷###

使用rep+tab方式更强于rea+tab，rep+tab更加简单；

###技巧###

@boards.each do |board| {} end #Ruby的特殊用法,Block，其他程序语言很少出现。

###技巧###

 Show => @board  #单复数对应关系，请注意
 index => @boards #单复数对应关系，请注意

###参考###

[railsforzombies](http://railsforzombies.org/),完成前两关的任务。

##v0.0.3: 改动资源关联方式##

###地雷###

作者的图书撰写有错误，应该按照v0.0.2最容易理解的思路撰写.控制器部分作者少写了很多内容。

###地雷###

注意routes.rb：

	resources :posts #注意resources与resource的区别。resources对应复数,resource对应单数.

###地雷###

	hm+tab #Textmate自动的代码需要注意删掉有关引用。

###技巧###

	:locals => {:f =>f } #此种方式的使用,主要是建立一个本地变量,以使得不出现逻辑次序的错误.

###技巧###

Textmate相关快捷方式，尤其是注意撰写资源的时候多使用。
	
	* rest+tab; 
	* f.+tab; 
	* linpp+tab;
	* linp+tab;
	* lip+tab;
	* rp+tab;
	* renp+tab; 
	* vp+tab；
	* ^+p;
	* if+tab;
	* table+tab;
	* end+tab;
	* bt+tab;
	* hm+tab;
	* mcol+tab;

###技巧###

跟踪日志文件,可以使用以下语句,主要跟踪与比较sql语句的差异。

	tail -f log/development.log 

如果安装了powder,则更加简单:

	powder applog

##v0.0.4: 使用before_filter简化控制器的定义##

###问题###

textmate的before_filter在何处？

##v0.0.5: 删除board的时候，将相关的post一起删除##

说明：这个版本提交有错误，没有提交成功。

###地雷###

错误写法：

	unless @posts.destroy
	  @board.destroy
	end

    unless @posts.destroy==true
      @board.destroy
    end

###问题###

如何保证数据完整性？如果post.destroy删除操作执行有错误，如何确保@board.destroy?

###问题###

如何批量删除post?

##v0.0.6: devise使用##

主要流程：

###安装devise###

	gem 'devise'
	bundle check
	bundle install

###准备数据库与视图###

	rails g -h #查看可以用的devise命令，一般插件的命令都在这里或者在rake -T里面。
	rails generate devise:install #
	rails generate devise User #
	rake db:migrate #
	rails g devise:views users #
	
###[内建导航](https://gist.github.com/1018112)###

参考上面这个gist

###增加<%= notice %>与<%= alert %>在application.html.erb###

###开始进行权限控制###

在posts_cntroller.rb进行下列操作：
 
	before_filter :authenticate_user!,:except=>[:show,:index]

修改控制器edit,update and destroy 

	@post=current_user.posts.find(params[:id])

对posts控制器的create增加@post.user_id=current_user.id

修改boards/show视图,进行是否是当前用户的判断，如果不是，则有些按钮不能显示：

	if post.user == current_user 

###地雷###

区分<% if post.user == current_user && current_user != nil %>与
<% if post.user == current_user || current_user != nil %>

###技巧###

[LiveReload](http://doabit.iteye.com/blog/715409)

###技巧###

bundle：

	bundle check
	bundle install
	
###技巧###

powder与pow，参考[Pow and Powder](http://www.yangzhiping.com/tech/pow.html)

	powder restart
	powder applog

###技巧###

gem常用列表,[参考](https://gist.github.com/1018108)

###技巧###

git的一些对tag操作的命令
  
	git tag -a v0.0.6 -m"devise"
	git tag -l
	git tag -d v0.0.6
	git push xdite :v0.0.6
	git push xdite --tags

##v0.0.7: 管理后台##

主要流程：

###1.创建路由###

使用命名空间

###2.复制views###

	$ mkdir app/controllers/admin/
	$ cd app/controllers
	$ cp app/controllers/posts_controller.rb app/controllers/admin/
	$ cp app/controllers/boards_controller.rb app/controllers/admin/
	$ mkdir app/views/admin/
	$ cp -rf app/views/posts/ app/views/admin/posts/
	$ cp -rf app/views/boards/ app/views/admin/boards/
	$ cp app/views/layouts/application.html.erb app/views/layouts/admin.html.erb

###3.增加控制器的prefix###

	class Admin::BoardsController < ApplicationController
	class Admin::PostsController < ApplicationController

###4.user_nav###

user_nav增加管理面板的导航，记得加以is_admin权限判断

###5.修改application_controller.rb###

增加管理员全线的判断。记得创建is_admin的migration

	def require_is_admin
	  unless(current_user && current_user.is_admin ? )
	    flash[:alert] = "You must be admin!"
	    redirect_to(root_path)
	end

####地雷####

	unless(current_user && current_user.is_admin?) #是对的，
	unless(current_user && current_user.is_admin ? ) #是错的。

###6。 砍掉前台的boards的CUD###

主要记得对应关系。尤其是控制器与Views的关系，还有路径的关系。

###7. 限制前台的boards的CUD只能从后台运行###

	@board => admin_board_path(@board)

####地雷####

注意:

		<li><%= link_to "link text...", boards_path %> #错误写法，board_path => /boards </li>
		<li><%= link_to "link text...", board_path(1) %> # => /board/1</li>
		<li><%= link_to "link text...", edit_admin_board_path(2) %> # => /admin/boards/2/edit</li> #半个错误写法，用这个来代替，<% form_for @post, :url=>admin_board_post_path(@board,@post) do |f| %>
		<li><%= link_to "link text...", new_admin_board_path %> # => admin/boards/new</li>

##v0.0.8:  posts计数与seeds.rb写法##

###conuter_cache###

增加posts_count字段在boards表的定义

	rails g migration add_posts_conuter_to_board

然后在app/models/post.rb，申明:counter_cache => true
    
	belongs_to :board, :class_name => "Board", :foreign_key => "board_id",:counter_cache => true

####技巧####

	$ rake db:redo
	$ rake db:drop
	$ rake db:create
	$ rake db:migrate
	$ rake db:seed --trace

###seeds.rb批量的写法###

	i=1
	until i>=100 do 
	  Board.create(:name=>('board_'+i.to_s)) 
	  i += 1
	end

####地雷####

>i += 1的位置与是否写出来了。

##v0.0.9: 分页插件##

教程使用的分页插件已经过时，请更换为：kaminari(https://github.com/amatsuda/kaminari)

###Model###

	paginates_per 5 #app/models/post.rb

###Controllers###

	@posts =@board.posts.order(:id).page(params[:page]) #app/controllers/boards_controller.rb的show action
	
####地雷####

>注意必须能使得count语句有作用，注意使用powder.applog跟踪sql日志。

###Views###

	<%= paginate @posts %> #app/views/boards/show.html.erb

##V0.1.0：Scope##

###增加default_scope###

	dc+tab #修改app/models/post.rb

###增加recent scope###

	scope :recent, :order => 'updated_at DESC'#修改app/models/post.rb
	@posts =@board.posts.recent.order(:id).page(params[:page])#修改app/controllers/boards_controller.rb的show action
	
###衍生问题###

作业1：直接点击id,title,content,created_at,updated_at五个表格抬头，进行排序。

作业2：除了default_score与score的作用之外，还有nc+tab;ncl+tab是什么意思？有什么作用？如何调用？
	
##v0.1.1:  paperclip插件的使用

###流程1：安装###

	gem 'paperclip'
	bundle check
	bundle install

###流程2：Models###

	has_attached_file :excerpt_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }

###流程3：Migrateion###

	rails g migration add_excerpt_image_to_post
	
###流程4：Views###

	:html => {:multipart => true } #app/views/posts/new.html_erb的form那里增加
	<%= f.file_field :excerpt_image %> #app/views/posts/_form.html_erb增加	

###流程5：controllers###

检查一下，是否包括了file_field的提交内容。

###流程6：继续修改views，显示出来###

	<div><%=image_tag @post.excerpt_image.url%></div>
	<div><%=image_tag @post.excerpt_image.url(:medium)%></div>
	<div><%=image_tag @post.excerpt_image.url(:thumb)%></div>

###参考###

[rails and paperclip](http://emersonlackey.com/article/paperclip-with-rails-3)

###技巧：自定义textmate快捷###

如何将一些Textmate没有的增加进来，例如：

	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

最终定义的效果如下：

	paperclipmc+Tab #paperclip migration相关
	paperclipm+tab  #paperclip m相关
	paperclipf+tab  #paperclip form相关
	paperclipff+tab #paperclip file_field相关
	paperclipit+tab #paperclip image_tag相关

增加.gitignore

	mate .gitignore 

##v0.1.2:  rake##

后缀是rake，而不是rb。rake相关的textmate快捷键：

	nam+tab
	tas+tab

rake的一些常用参数：

	rake -T
	rake dev:rebuild -t #rake dev:rebuild --trace

##v0.1.3##

###1.服务器的准备工作###

	sudo useradd apps #增加apps账号
	sudo passwd apps  #设置apps账号密码
	sudo mkdir /home/apps #创建目录
	sudo chown -R apps:apps /home/apps #设置权限

在服务器上操作，创建密钥.
	
	sudo su apps #以刚创建的apps账号登陆
	ssh-keygen  #创建apps的ssh keygen，此时记得填入Mac开发机器上的密钥信息.
	more /home/apps/.ssh/id_rsa) #输出这个keygen的信息

在github相应的项目添加keygen信息。如果希望一个管理所有项目，请在账户设置中增加SSH Public Keys。

###2.将database.yml文件单独处理###

mkdir forum_demo
mkdir -p forum_demo/shared/config
vim forum_demo/shared/config/database.yml.production#填入数据库密码信息

更多可以[参考这里](http://www.simonecarletti.com/blog/2009/06/capistrano-and-database-yml/)

###3.配置nginx###

nginx.conf增加：

	server {
	   listen 80;
	   server_name tech.yangzhiping.com;
	   root /home/apps/forum_demo/public;   # <--- be sure to point to 'public'!
	   passenger_enabled on;
	}

更多参考：[在ubuntu上搭建基于ree+nginx+passenger的rails3环境](http://www.yangzhiping.com/tech/ubuntu-ree-nginx-passenger-rails3.blog.html)

###4.配置cap###

安装

	gem 'capistrano'
	gem 'capistrano-ext'
	bundle check
	bundle install


在Rails根目录下运行：

	capify . 

系统自动增加2个文件：

	/Capfile                     #启动设置
	/config/deploy.rb            #目录设置

在系统自动生成的基础上修改.更多参数可以[参考这里](http://help.github.com/deploy-with-capistrano/)或者参考[gist1022819](https://gist.github.com/1022819)
	
第一次开始：

	cap deploy:setup #在服务器上自动创建目录结构
	cap deploy:check #检查目录结构正确配置 

增加一些Git忽略文件:

	mate .gitignore #railsｕ应用根目录下
	git add .gitignore # 增加忽略
	git commit -am "add .gitignore" #提交
	git push xdite #提交

日常操作：

	cap deploy              #分发
	cap deploy:migrate      #迁移数据库
	cap deploy:rollback     #回滚
	cap deploy:restart      #重开

