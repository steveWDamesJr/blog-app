require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    Post.new(title: 'How to be a Jedi Warrior!',
             text: 'When you are a Jedi Warrior your path is certain. Use the force',
             author_id: 2, comments_counter: 0, likes_counter: 0)
  end

  before { subject.save }

  it 'title is present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title does not extend beyond 250 characters' do
    subject.title = 'It is a period of civil war. Rebel spaceships,
     striking from a hidden base, have won their first victory against
     the evil Galactic Empire. During the battle, Rebel spies managed
     to steal secret plans to the Empire’s ultimate weapon, the
     DEATH STAR, and space station with enough power to destroy an entire planet.'
    expect(subject).to_not be_valid
  end

  it 'post_counter method raises an error if there is no user' do
    expect { subject.post_counter }.to raise_error(NoMethodError)
  end

  it 'comments_counter should be greater than or equal to zero' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'no comments should exist' do
    expect(subject.recent_comments.length).to eq(0)
  end
end
