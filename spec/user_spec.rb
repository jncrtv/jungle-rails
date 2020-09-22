require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    before :each do 
      @user = User.new(name:"Cam Newton", email: "supermancam@gmail.com", password: "cam", password_confirmation: "cam")
      @user.save!
    end
    it "Should return error saying Name can't be blank " do
      @user.name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include ("Name can't be blank")
      expect(@user).to_not be_valid
    end
    it "Should return error saying Email can't be blankl" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include ("Email can't be blank")
      expect(@user).to_not be_valid
    end
    it "Should return error saying Password can't be blank" do
      @user.password = nil
      @user.password_confirmation =nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
      expect(@user).to_not be_valid
    end
    it "Should return error saying Password confirmation doesn't match Password" do
      @user.password = "cam"
      @user.password_confirmation = "CAM"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      expect(@user).to_not be_valid
    end
  end
  describe '.authenticate_with_credentials' do
    # examples for this class method here
    before :each do 
      @user = User.new(name:"Cam Newton", email: "supermancam@gmail.com", password: "cam", password_confirmation: "cam")
    end
    it "Should return correct user" do
      @user.save
      user = User.authenticate_with_credentials("supermancam@gmail.com", "cam")
      expect(@user).to be == user
    end 
  end
end