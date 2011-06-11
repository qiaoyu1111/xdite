class AddPostsConuterToBoard < ActiveRecord::Migration
  def self.up
    add_column :boards, :posts_count, :integer
  end

  def self.down
    remove_column :boards, :posts_count
  end
end
