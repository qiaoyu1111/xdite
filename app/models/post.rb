class Post < ActiveRecord::Base
  belongs_to :board, :class_name => "Board", :foreign_key => "board_id"
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  validates_presence_of :title, :on => :create, :message => "can't be blank"
  validates_presence_of :content, :on => :create, :message => "can't be blank"
end
