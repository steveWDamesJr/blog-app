require 'rails_helper'

RSpec.describe 'Test Index Page', type: :feature do
  describe 'GET index' do
    before(:each) do
      @first_user = User.create(name: 'Jax', photo: 'test_photo1.png', bio: 'bio1', posts_counter: 0)
      @first_user.save!
      @second_user = User.create(name: 'Johnny', photo: 'test_photo2.png', bio: 'bio2', posts_counter: 0)
      @second_user.save!
      @third_user = User.create(name: 'Raiden', photo: 'test_photo3.png', bio: 'bio3', posts_counter: 0)
      @third_user.save!
    end
    scenario 'shows correct content' do
      visit users_path
      sleep(5)
      expect(page).to have_content('the Users')
    end
    feature 'User Index' do
      background { visit users_path }
      scenario 'See all usernames' do
        expect(page).to have_content('Jax')
        expect(page).to have_content('Johnny')
        expect(page).to have_content('Raiden')
      end
      scenario 'See number of posts written by each user' do
        expect(page).to have_content('Number of Posts: 0')
      end
      scenario 'See profile pic' do
        expect(page.first('img')['src']).to eq('https://via.placeholder.com/150.png/09f/fff')
      end
      scenario 'When I click a user, I am redirected to the user show page' do
        click_link 'Jax', match: :first
        expect(current_path).to eq user_path(User.first.id)
      end
    end
  end
end
