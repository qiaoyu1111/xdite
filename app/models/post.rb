class Post < ActiveRecord::Base
  paginates_per 5
  belongs_to :board, :class_name => "Board", :foreign_key => "board_id",:counter_cache => true
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"
  #default_scope :order => 'created_at DESC'
  scope :recent, :order => 'updated_at DESC'
  has_attached_file :excerpt_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
  validates_presence_of :title, :on => :create, :message => "can't be blank"
  validates_presence_of :content, :on => :create, :message => "can't be blank"
  
end