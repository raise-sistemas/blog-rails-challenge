class Post < ApplicationRecord
  validates :title, :body, presence: true

  def to_param
    "#{id}-#{title.parameterize}"
    # gera URL amigável a partir do título
    # Ex.: "1-primeiro-post"
  end
end
