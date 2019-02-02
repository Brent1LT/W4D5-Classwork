  require 'rails_helper'

RSpec.describe User, type: :model do

  FactoryBot.build(:user)
  # subject(:user){User.create(username: 'Blah', password: 'Bloodier')}


  describe 'validations' do
    it {should validate_presence_of(:username)}
    it {should validate_presence_of(:session_token)}
    it {should validate_presence_of(:password_digest)}
    it {should validate_uniqueness_of(:username)}
    it {should validate_uniqueness_of(:session_token)}
    it {should validate_length_of(:password).is_at_least(6) }
  end

  describe '::find_by_credentials' do 
    it 'finds a user otherwise returns nil' do 
      expect(User.find_by_credentials("Blad", "bloodier1")).to_not be nil
    end
  end
  
  
end

