require 'rails_helper'

RSpec.describe 'Test user index page', type: :feature do
  describe 'GET index' do
    before(:each) do
      @first_user = User.create(name: 'Lue', photo: 'test_photo.png', bio: 'bio', posts_counter: 0)
      @first_user.save!
      @first_post = Post.create(author: @first_user, title: 'So Awesome', text: 'I am Lue and it is great to be here',
                                comments_counter: 0, likes_counter: 0, id: 1)
      @second_post = Post.create(author: @first_user, title: 'Holiday Time', text: 'I am traveling to Spain',
                                 comments_counter: 0, likes_counter: 0, id: 2)
      @third_post = Post.create(author: @first_user, title: 'Shopping', text: 'Paris, Milan, Moroco malls',
                                comments_counter: 0, likes_counter: 0, id: 3)
      @fourth_post = Post.create(author: @first_user, title: 'Great movies',
                                 text: 'J park, T form, Fast n Fur', comments_counter: 0, likes_counter: 0, id: 4)
    end
    scenario 'shows the correct content' do
      visit users_path
      sleep(5)
      expect(page).to have_content('Welcome to the Users')
    end
    feature 'User Index' do
      background { visit user_path(id: @first_user.id) }
      scenario 'See profile pic' do
        expect(page.first('img')['src']).to eq('https://via.placeholder.com/150.png/09f/fff')
      end
      scenario 'Username is shown' do
        expect(page).to have_content('Lue')
      end
      scenario "User's bio is visible" do
        expect(page).to have_content('bio')
      end
      scenario 'View all post button is on screen' do
        visit user_path(id: @first_user.id)
        expect(page).to have_content('See all posts')
      end
      scenario 'See number of posts written by each user' do
        expect(page).to have_content('Number of Posts: 4')
      end
      scenario 'See first three posts' do
        visit user_path(id: @first_user.id)
        expect(page).to have_content('Great movies')
        visit user_path(id: @first_user.id)
        expect(page).to have_content('Shopping')
        visit user_path(id: @first_user.id)
        expect(page).to have_content('Holiday Time')
        visit user_path(id: @first_user.id)
        expect(page).not_to have_content('So Awesome')
      end
      scenario 'When I click a posts, I am redirected to the posts show page' do
        click_link 'See post details', match: :first
        expect(current_path).to eq '/users/8/posts/4'
      end
    end
  end
end

# visit user_posts_path(@user)
