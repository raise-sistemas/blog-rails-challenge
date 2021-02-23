class Post < ApplicationRecord
  validates :title, :body, presence: true

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
