require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end

  describe 'pagination' do
    it 'return limited quantity of records based on page' do
      5.times { Post.create(title: 'Title', body: 'Body')}
      posts = Post.paginate(page: 1)
      expect(posts.count).to eq(4)
      posts = Post.paginate(page: 2)
      expect(posts.count).to eq(1)
    end
  end
end
