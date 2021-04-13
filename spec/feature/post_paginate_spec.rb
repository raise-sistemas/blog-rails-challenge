require 'rails_helper'

feature 'Feature: Paginate Posts' do
  
  context 'Posts with pagination' do
    let!(:posts) do
      posts = Post.all
      posts.each(&:delete)

      new_posts = []
      (1..10).each do |value|
        new_posts << Post.new(title: "New Post #{value}", body: 'Content Body')
      end

      new_posts.each(&:save)
    end
    
    context 'First Page' do
      before do
        visit posts_url
      end
      
      it { expect(page).to have_text('Posts') }
      it { expect(page).to have_no_xpath("//*[@class='pagination']//a[text()='<< Previous --']") }
      it { expect(page).to have_xpath("//*[@class='pagination']//a[text()='Next >>']") }
  
      scenario 'click in Next link to next page' do
        find("//*[@class='pagination']//a[text()='Next >>']").click
        expect(page.status_code).to eq(200)
      end
    end

    context 'Next Pages' do
      before do
        visit posts_url
        find("//*[@class='pagination']//a[text()='Next >>']").click
      end

      it { expect(page).to have_xpath("//*[@class='pagination']//a[text()='<< Previous --']") }
      it { expect(page).to have_xpath("//*[@class='pagination']//a[text()='Next >>']") }
    end
    
    context 'Last Page' do
      before do
        per_page = 4
        last_page = (Post.count / per_page.to_f).ceil
        visit posts_url(page: last_page - 1)
      end

      it { expect(page).to have_xpath("//*[@class='pagination']//a[text()='<< Previous --']") }
      it { expect(page).to have_no_xpath("//*[@class='pagination']//a[text()='Next >>']") }
    end
  end
  context 'Posts without pagination' do
    let!(:posts) do
      posts = Post.all
      posts.each(&:delete)

      new_posts = []
      (1..4).each do |value|
        new_posts << Post.new(title: "New Post #{value}", body: 'Content Body')
      end

      new_posts.each(&:save)
    end

    context 'only page' do
      before do
        visit posts_url
      end

      it { expect(page).to have_text('Posts') }
      it { expect(page).to have_no_xpath("//*[@class='pagination']//a[text()='<< Previous --']") }
      it { expect(page).to have_no_xpath("//*[@class='pagination']//a[text()='Next >>']") }
    end
  end
end
