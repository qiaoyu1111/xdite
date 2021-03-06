class Board < ActiveRecord::Base
  paginates_per 10
  has_many :posts
  validates_presence_of :name, :on => :create, :message => "can't be blank"
end
