require 'rails_helper'

RSpec.describe Profile, type: :model do
  it 'should save if is valid' do
    owner = Profile.new
    owner.full_name = 'Sam'

    expect(owner).to be_valid
  end

  it 'should not save when full name is empty' do
    owner = Profile.new

    expect(owner).not_to be_valid
    expect(owner.errors[:full_name]).to include("can't be blank")
  end
end
