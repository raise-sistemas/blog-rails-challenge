class Post < ApplicationRecord
  validates :title, :body, presence: true

  # Returns a String, which Action Pack uses for constructing an URL to this object.
  def to_param
    "#{id}-#{title.parameterize}"
  end
end
