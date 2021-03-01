class Post < ApplicationRecord
  # Adiciona scope que retorna somente Posts que foram publicados
  scope :published, -> { where.not(published_at: nil) }

  validates :title, :body, presence: true
end
