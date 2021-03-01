class Post < ApplicationRecord
  include Pagination
  validates :title, :body, presence: true
end
