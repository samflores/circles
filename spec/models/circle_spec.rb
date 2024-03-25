require 'rails_helper'

RSpec.describe Circle, type: :model do

  it 'should save when the parameters are correct' do
    owner = Profile.create(full_name: 'Sam')
    circle = Circle.new
    circle.name = 'Family'
    circle.owner = owner 
    circle.save

    expect(circle).to be_valid
  end

  it 'should not save when has not owner' do
    circle = Circle.new
    circle.name = 'Family'
    
    expect(circle).not_to be_valid
    expect(circle.errors[:owner]).to include('must exist')
  end

  it 'should not save when name is empty' do
    circle = Circle.new
    
    expect(circle).not_to be_valid
    expect(circle.errors[:name]).to include("can't be blank")
  end
end
