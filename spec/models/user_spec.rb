require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Luke') }

  before { subject.save }

  it 'Name is present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be greater than or equal to zero' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'Has no recent posts' do
    expect(subject.recent_posts.length).to eq(0)
  end
end
