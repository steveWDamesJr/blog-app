require 'rails_helper'

RSpec.describe Like, type: :model do
  subject { Like.new }

  before { subject.save }

  it 'like_counter should raise error if there is no post' do
    expect { subject.like_counter }.to raise_error(NoMethodError)
  end
end
