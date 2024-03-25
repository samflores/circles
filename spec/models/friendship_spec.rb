require 'rails_helper'

RSpec.describe Friendship, type: :model do
  it 'should save when is valid' do
    circle = Circle.new
    circle.name = 'Family'

    profile = Profile.new
    profile.full_name = 'Sam'

    friendship = Friendship.new
    friendship.profile = profile
    friendship.circle = circle

    expect(friendship).to be_valid
  end

  it 'should not save when is missing circle' do
    profile = Profile.new
    profile.full_name = 'Sam'
    friendship = Friendship.new
    friendship.profile = profile

    expect(friendship).not_to be_valid
    expect(friendship.errors[:circle]).to include('must exist')
  end

  it 'should not save when is missing profile' do
    circle = Circle.new
    circle.name = 'Family'
    friendship = Friendship.new
    friendship.circle = circle

    expect(friendship).not_to be_valid
    expect(friendship.errors[:profile]).to include('must exist')
  end
end
