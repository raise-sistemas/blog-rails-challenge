require 'rails_helper'

feature 'Feature: publish a Post' do
  before do
    @post = Post.create(title: 'New Post', body: 'Content body')
    visit "/posts/#{@post.id}/edit"
  end
  scenario 'visit the Post edit view' do
    expect(page).to have_text('Editing Post')
  end

  context 'on success' do
    scenario 'click in publish button to publish a Post and redirect to published view' do
      click_button 'Publish'
      expect(current_path).to eq(published_posts_path)
      expect(page).to have_text('Post published successfully!')
    end
  end

  context 'on fails' do
    scenario 'after click in publish button redirect to edit view' do
      allow_any_instance_of(Post).to receive(:save).and_return(false)
      click_button 'Publish'
      expect(current_path).to eq(edit_post_path(@post))
      expect(page).to have_text('Post unpublished!')
    end
  end
end
