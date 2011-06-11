# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

user=User.new(:email=>'rails2012@qq.com',:password=>'87654123')
user.is_admin = true
user.save!

user=User.new(:email=>'ouyang@anren.me',:password=>'87654123')
user.is_admin = false
user.save!

i=1
until i>=100 do 
  board=Board.create(:name=>('board_'+i.to_s))  
 Post.create(:title=>('post_title_'+i.to_s),:content=>('post_content_'+i.to_s),:board_id=>board.id,:user_id=>'2')
  i += 1
end 
  
  

#boards = Board.create(:name=>name[i])

