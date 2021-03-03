class Post < ApplicationRecord
  # Adiciona scope que retorna somente Posts que foram publicados
  scope :published, -> { where.not(published_at: nil) }

  validates :title, :body, presence: true

  def publish!
    update!(published_at: Time.now)
  end
end
