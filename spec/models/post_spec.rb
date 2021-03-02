require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end

  describe 'Friendly URL' do
    it 'return friendly URL based on ID and title' do
      post = Post.create({title: 'First Post', body: 'Post body'})
      expect(post.to_param).to eq("#{post.id}-#{post.title.parameterize}")
    end
  end
end
