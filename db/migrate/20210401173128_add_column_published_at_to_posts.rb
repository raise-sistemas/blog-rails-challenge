class AddColumnPublishedAtToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :published_at, :datetime, default: DateTime.current
  end
end
