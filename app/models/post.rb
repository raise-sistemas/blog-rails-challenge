class Post < ApplicationRecord
  validates :title, :body, presence: true

  # Add parameterize for url customization
  def to_param
    "#{id}-#{title.parameterize}"
  end
end
