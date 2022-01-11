require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "it shouldn't create a user if password and password_confirmations don't match" do
      @user = User.create(name: "Bob The Builder", email: "bobthebuilder@buildthings.com", password: "ilikebubbaaa", password_confirmation: "ilikebubba")
      expect(@user.password).to_not eql (@user.password_confirmation)
    end
    it "it should create a matching password and password_confirmations " do
      @user = User.create(name: "Bob The Builder", email: "bobthebuilder@buildthings.com", password: "ilikebubba", password_confirmation: "ilikebubba")
      expect(@user.password).to eql (@user.password_confirmation)
    end
    it "shouldn't create an account if the password is too short" do
      @user = User.create(name: "Bob The Builder", email: "bobthebuilder@buildthings.com", password: "ilik", password_confirmation: "ilik")
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 8 characters)")
    end
  end
  
  describe '.authenticate_with_credentials' do
    it "it shouldn't allow the user to login if the e-mail isn't found" do
      expect(User.authenticate_with_credentials('robinhood@gmail.com', 'ilovered')).to be_falsey 
    end
    it "it should allow the user to login if the e-mail is found" do
      expect(User.authenticate_with_credentials("bobthebuilder@buildthings.com", "ilikebubba")).to be_truthy
    end
    it "it should allow the user to login if there spaces before and/or after their email address" do
      expect(User.authenticate_with_credentials(" bobthebuilder@buildthings.com ", "ilikebubba")).to be_truthy
    end
    it "it should allow the user to login if there are uppercase letters in the email" do
      expect(User.authenticate_with_credentials("BobTheBuilder@buildthings.com ", "ilikebubba")).to be_truthy
    end
  end
end




