require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:post) { described_class.create(title: 'New Title', body: 'New Body') }
  let(:mock_date_time) { allow(DateTime).to receive(:current).and_return(DateTime.current) }

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end

  context 'create object with correct values' do
    describe 'published_at' do
      context 'when it is not defined, it must have the default value' do
        it { expect(post).to be_valid }
        it { expect(post.published_at).to be_a Time }
      end

      context 'shold allow null value' do
        before do
          @post = Post.new(title: 'New Title', body: 'New Body', published_at: nil)
          @post.save!
        end

        it { expect(@post).to be_valid }
        it { expect(@post.published_at).to eq nil }
      end

      context 'shold allow DateTime values' do
        before do
          mock_date_time
          @post = Post.new(title: 'New Title', body: 'New Body', published_at: DateTime.current)
          @post.save!
        end

        it { expect(@post).to be_valid }
        it { expect(@post.published_at).to eq DateTime.current }
      end
    end

    describe 'status' do
      context 'when create object the status must be unpublished' do
        it { expect(post).to be_valid }
        it { expect(post.unpublished?).to be_truthy }
      end

      context 'shold allow for change status to published' do
        before do
          @post = Post.new(title: 'New Title', body: 'New Body', status: :published)
        end

        it { expect(@post).to be_valid }
        it { expect(@post.published?).to be_truthy }
      end
    end

    describe '#publish' do
      context 'shold publish the post' do
        before do
          mock_date_time
          @post = Post.new(title: 'New Title', body: 'New Body')
          @post.publish
        end

        context 'change status field to published' do
          it { expect(@post.published?).to be_truthy }
        end

        context 'change published_at field to current Time' do
          it { expect(@post.published_at).to eq DateTime.current }
        end
      end
    end
  end
end
