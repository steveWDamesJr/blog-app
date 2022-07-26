require 'rails_helper'

RSpec.describe 'Test user post index page', type: :feature do
  describe 'GET post index page' do
    before(:each) do
      @first_user = User.create(name: 'Lue', photo: 'test_photo.png', bio: 'bio', posts_counter: 0)
      @first_user.save!
      @first_post = Post.create(author: @first_user, title: 'So Awesome', text: 'I am Lue and it is great to be here',
                                comments_counter: 0, likes_counter: 0, id: 1)
      @first_comment = Comment.create(post: @first_post, author: @first_user, text: 'Hi Lue! Great to have you here!')
      @like = Like.create(post: @first_post, author: @first_user)
    end
    scenario 'shows the correct content' do
      visit user_posts_path(@first_user.id)
      sleep(5)
      expect(page).to have_content('Welcome to the Post View')
    end
    feature 'User post index page' do
      background { visit user_posts_path(@first_user.id) }
      scenario 'See profile pic' do
        expect(page.first('img')['src']).to eq('https://via.placeholder.com/150.png/09f/fff')
      end
      scenario 'Username is shown' do
        expect(page).to have_content('Lue')
      end
      scenario 'See number of posts written by user' do
        expect(page).to have_content('Number of Posts: 1')
      end
      scenario 'See a post title' do
        expect(page).to have_content('So Awesome')
      end
      scenario 'See post body on page' do
        expect(page).to have_content('I am Lue')
      end
      scenario 'Can see first comment on post' do
        expect(page).to have_content('Great to have you')
      end
      scenario 'Can see number of comments for a post' do
        expect(page).to have_content('Comments: 1')
      end
      scenario 'Can see number of likes for a post' do
        expect(page).to have_content('Likes: 1')
      end
      scenario 'Can see pagination section' do
        expect(page).to have_content('Pagination')
      end
      scenario 'When I click a post, I am redirected to that post index page' do
        click_link 'See post details'
        expect(current_path).to eq user_post_path(@first_post.author, @first_post)
      end
    end
  end
end
