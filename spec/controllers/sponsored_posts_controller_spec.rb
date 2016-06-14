require 'rails_helper'

RSpec.describe SponsoredPostsController, type: :controller do
let(:my_topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
let(:my_sponsored_post) {my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(1..100)) }

  describe "GET show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
      get :show, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to render_template :show
    end
    it "assigns my_sponsored_post to @sponsored_post" do
      get :show, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(assigns(:sponsored_post)).to eq(my_sponsored_post)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end
    it "renders the new view" do
      get :new, topic_id: my_topic.id
    end
    it "instantiates a new sponsored_post" do
      get :new, topic_id: my_topic.id
      expect(assigns(:sponsored_post)).not_to be_nil
    end
  end

  describe "POST create" do
    it "increases number of sponsored_posts by 1" do
      expect{ post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(1..100)}}.to change(SponsoredPost,:count).by(1)
    end
    it "assigns the new sponsored post to @sponsored_post" do
      post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(1..100)}
      expect(assigns(:sponsored_post)).to eq SponsoredPost.last
    end
    it "redirects to new post" do
      post :create, topic_id: my_topic.id, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph, price: rand(1..100)}
      expect(response).to redirect_to [my_topic, SponsoredPost.last]
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to have_http_status(:success)
    end
    it "renders the edit view" do
      get :edit, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to render_template :edit
    end
    it "assigns sponsored_post to be updated @sponsored_post" do
      get :edit, topic_id: my_topic.id, id: my_sponsored_post.id

      edit_sponsored_post = assigns(:sponsored_post)

      expect(edit_sponsored_post.id).to eq my_sponsored_post.id
      expect(edit_sponsored_post.title).to eq my_sponsored_post.title
      expect(edit_sponsored_post.body).to eq my_sponsored_post.body
      expect(edit_sponsored_post.price).to eq my_sponsored_post.price
    end
  end

  describe "PUT update" do
    it "updates with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      new_price = rand(1..100)
      put :update, topic_id: my_topic.id, id: my_sponsored_post.id, sponsored_post: {title: new_title, body: new_body, price: new_price}

      edit_instance = assigns(:sponsored_post)

      expect(edit_instance.id).to eq my_sponsored_post.id
      expect(edit_instance.title).to eq new_title
      expect(edit_instance.body).to eq new_body
      expect(edit_instance.price).to eq new_price
    end
    it "redirects to the edited post" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph
      new_price = rand(1..100)

      put :update, topic_id: my_topic.id, id: my_sponsored_post.id, sponsored_post: {title: new_title, body: new_body, price: new_price}
      expect(response).to redirect_to [my_topic, my_sponsored_post]
    end
  end
end