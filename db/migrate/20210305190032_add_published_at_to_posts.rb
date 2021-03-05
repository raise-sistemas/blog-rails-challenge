class AddPublishedAtToPosts < ActiveRecord::Migration[6.1]
  def change
    # Add to to table Posts, column published_at (DateTime) accepting also null
    add_column :posts, :published_at, :datetime, null: true

    # Update posts new attribute with current date
    Post.all.each { |p| p.update_attribute(:published_at, Date.current) }
  end

  def down
    # In case of rollback, remove column published_at
    remove_column :posts, :published_at
  end
end
