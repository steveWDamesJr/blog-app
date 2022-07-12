require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:example) { get '/users/:user_id/posts' }
    it 'is a success' do
      expect(response).to have_http_status(200)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'should include the text' do
      expect(response.body).to include 'Welcome to the Post View'
    end
  end

  describe 'GET #show' do
    before(:example) { get '/users/:user_id/posts/:id' }
    it 'is a success' do
      expect(response).to have_http_status(200)
    end
    it "renders 'index' template" do
      expect(response).to render_template('show')
    end
    it 'should include the text' do
      expect(response.body).to include 'Here is a list of posts for a given user'
    end
  end
end
