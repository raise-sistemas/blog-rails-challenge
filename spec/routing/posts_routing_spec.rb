require "rails_helper"

RSpec.describe PostsController, type: :routing do
  describe "routing" do
    it "routes root to posts#published" do
      expect(get: "/").to route_to("posts#published")
    end

    it "routes to #index" do
      expect(get: "/posts").to route_to("posts#index")
    end

    it "routes to #published" do
      expect(get: "/posts/published").to route_to("posts#published")
    end

    it "routes to #new" do
      expect(get: "/posts/new").to route_to("posts#new")
    end

    it "routes to #show" do
      expect(get: "/posts/1").to route_to("posts#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/posts/1/edit").to route_to("posts#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/posts").to route_to("posts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/posts/1").to route_to("posts#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/posts/1").to route_to("posts#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/posts/1").to route_to("posts#destroy", id: "1")
    end

    it "routes to #publish" do
      expect(patch: "/posts/1/publish").to route_to("posts#publish", id: "1")
    end
  end
end
