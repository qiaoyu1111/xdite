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

i=0
until i>=100 do
  names=Array.new
  names[i]='board_'+i.to_s
  i += 1
end
names.each do |name|
  board=Board.create(:name=>name)
end
  

#boards = Board.create(:name=>name[i])

