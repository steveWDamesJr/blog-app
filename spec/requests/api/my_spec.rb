require 'swagger_helper'

RSpec.describe 'Blog App API', type: :request do
  path '/users/1/posts' do
    # url: user_posts_path
    post 'Test create blog post' do
      tags 'Posts'
      consumes 'application/json'
      parameter name: :posts, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          text: { type: :string },
          comments_counter: { type: :integer },
          likes_counter: { type: :integer }
        },
        required: %w[title text]
      }

      response '201', 'post created' do
        let(:posts) { { title: 'First Test Post', text: 'This is a test' } }
        run_test!
      end

      # response '422', 'invalid request' do
      #   let(:post) { { title: 'First Test Post' } }
      #   run_test!
      # end
    end
  end

  # path '/users/2/posts/4' do

  #   get 'Retrieves a post' do
  #     tags 'Posts', 'Another Tag'
  #     produces 'application/json', 'application/xml'
  #     parameter name: :id, in: :path, type: :string

  #     response '200', 'posts found' do
  #       schema type: :object,
  #         properties: {
  #           id: { type: :integer },
  #           title: { type: :string },
  #           text: { type: :string }
  #         },
  #         required: [ 'id', 'title', 'text' ]

  #       let(:id) { Post.create(title: 'First Test Post', text: 'bar').id }
  #       run_test!
  #     end

  #     response '404', 'blog not found' do
  #       let(:id) { 'invalid' }
  #       run_test!
  #     end

  #     response '406', 'unsupported accept header' do
  #       let(:'Accept') { 'application/foo' }
  #       run_test!
  #     end
  #   end
  # end
end
