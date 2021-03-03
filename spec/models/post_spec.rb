require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end

  describe 'scopes' do
    it "does returns only published posts" do
      Post.create({title: "Title Ok", body: "Body Ok", published_at: nil})
      Post.create({title: "Title Ok", body: "Body Ok", published_at: Time.now})

      # Teste o comportamento esperado de retornar somente Posts que têm um
      # valor não nulo atribuído a published_at
      expect(Post.published).to_not include(Post.where(published_at: nil))
    end
  end
end
