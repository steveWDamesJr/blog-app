require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path }
    it 'is a success' do
      expect(response).to have_http_status(200)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'should include the text' do
      expect(response.body).to include 'Welcome to the Users'
    end
  end

  describe 'GET #show' do
    before(:example) { get user_path :id }
    it 'is a success' do
      expect(response).to have_http_status(200)
    end
    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
    it 'should include the text' do
      expect(response.body).to include 'Here is an individual user with their bio and recent posts'
    end
  end
end
