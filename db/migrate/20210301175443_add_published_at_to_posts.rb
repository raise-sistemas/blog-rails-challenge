class AddPublishedAtToPosts < ActiveRecord::Migration[6.1]
  def up
    add_column :posts, :published_at, :datetime, null: true
    Post.all.each{|post| post.update_attribute(:published_at, Date.current)}
  end

  def down
    remove_column :posts, :published_at
  end
end
