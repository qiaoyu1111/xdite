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
until i>100
  board=Board.create(:name=>('board_name_'+i.to_s))
  k=1
  until k>10 
    Post.create(:title => ('post_title_'+k.to_s),:content => ('post_content_'+k.to_s),:user_id => '2',:board_id => board.id)
  k+=1
  end
  i+=1
  
end

  

#boards = Board.create(:name=>name[i])

