require 'rails_helper'
RSpec.describe 'Test post show page', type: :feature do
  describe 'GET post show page' do
    before(:each) do
      @first_user = User.create(name: 'Lue', photo: 'test_photo.png', bio: 'bio', posts_counter: 0)
      @first_user.save!
      @first_post = Post.create(author: @first_user, title: 'So Awesome', text: 'I am Lue and it is great to be here',
                                comments_counter: 0, likes_counter: 0, id: 1)
      @first_comment = Comment.create(post: @first_post, author: @first_user, text: 'Hi Lue! Great to have you here!')
      @like = Like.create(post: @first_post, author: @first_user)
    end
    scenario 'shows the correct content' do
      visit user_post_path(@first_post.author, @first_post)
      sleep(5)
      expect(page).to have_content('posts for a given user')
    end
    feature 'User post show page' do
      background { visit user_post_path(@first_post.author, @first_post) }
      scenario 'Can see posts title' do
        expect(page).to have_content('So Awesome')
      end
      scenario 'Can see author of post' do
        expect(page).to have_content('Lue')
      end
      scenario 'Can see number of comments' do
        expect(page).to have_content('Comments: 1')
      end
      scenario 'Can see number of likes' do
        expect(page).to have_content('Likes: 1')
      end
      scenario 'Can see post body text' do
        expect(page).to have_content('great to be here')
      end
      scenario 'Can see author of comment' do
        expect(page).to have_content('Lue')
      end
      scenario 'Can see comment text from commenter' do
        expect(page).to have_content('Great to have you')
      end
    end
  end
end
