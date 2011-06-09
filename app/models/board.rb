class Board < ActiveRecord::Base
  has_many :posts
  validates_presence_of :name, :on => :create, :message => "can't be blank"
end
