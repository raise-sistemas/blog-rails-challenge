class Post < ApplicationRecord
  validates :title, :body, presence: true

  def self.paginate( page: 1)
    limit(4).offset((page - 1) * 4)
  end
end
