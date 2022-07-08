require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject { Comment.new(text: 'What a great Jedi!') }

  before { subject.save }

  it 'comment_counter should raise error if there is no post' do
    expect { subject.comment_counter }.to raise_error(NoMethodError)
  end
end
