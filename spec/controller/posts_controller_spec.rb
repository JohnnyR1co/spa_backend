# frozen_string_literal: true
require "rails_helper"

RSpec.describe Api::PostsController, type: :controller do

  let!(:post) { create(:post) }

  describe "GET #index" do

    it "responds successfully" do
      get :index
      expect(response).to be_success
    end

    it "loads all of the posts into @posts" do
      post1, post2 = Post.create!, Post.create!
      get :index

      expect(assigns(:posts)).to eq([post, post1, post2])
    end
  end

  describe "GET #show" do

    it "assigns the requested customer as @customer" do
      get :show, params: { id: post.id }
      expect(assigns(:post)).to eq(post)
    end
  end

  describe "POST #create" do

    it "creates a new post" do
      expect(Post.count).to eq(1)
    end
  end

  describe "DELETE #destroy" do

    it "deletes the contact" do
      expect{
        delete :destroy, params: { id: post.id }
        }.to change(Post, :count).by(-1)
    end
  end
end
