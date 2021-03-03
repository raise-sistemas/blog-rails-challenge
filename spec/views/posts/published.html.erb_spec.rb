require 'rails_helper'

RSpec.describe "posts/published", type: :view do
  before(:each) do
    assign(:posts, [
      Post.create!(
        title: "Title",
        body: "MyText"
      ),
      Post.create!(
        title: "Title",
        body: "MyText"
      )
    ])
  end

  it "renders a list of published posts" do
    render
    assert_select "h2", text: "Title".to_s, count: 2
    assert_select "blockquote", text: "MyText".to_s, count: 2
  end
end
