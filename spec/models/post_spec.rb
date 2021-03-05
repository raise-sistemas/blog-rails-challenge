require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end

  describe 'posts order' do
    it 'should show posts ordered by descending created_at column' do
      posts = Post.order(created_at: :desc)
      first_post = posts.first
      last_post = posts.last
      expect(last_post.created_at).to > first_post.created_at
    end
  end
end
