require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before :each do
      # create working example
      @user_spec = {
        first_name:'test',
        last_name:'test',
        email:'test@gmail.com',
        password:'12345',
        password_confirmation:'12345'
      }
      @user = User.new(@user_spec)
    end

    context 'given password and password_confirmation fields' do
      it 'should not be created if the two fields do not match' do
        @user_spec[:password_confirmation] = 'abcd'
        @user = User.new(@user_spec)
        @user.save
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
      end
    end

    it 'should not be created if the given email is not unique (case insensitive)' do
      @user_spec[:email] = 'TEST@TEST.COM'
      @user = User.new(@user_spec)
      @user.save
      expect(@user.errors[:email]).to include('has already been taken')
    end

    it 'should not be created if email is nil' do
      @user_spec[:email] = nil
      @user = User.new(@user_spec)
      @user.save
      expect(@user.errors[:email]).to include("can't be blank")
    end

    it 'should not be created if first_name is nil' do
      @user_spec[:first_name] = nil
      @user = User.new(@user_spec)
      @user.save
      expect(@user.errors[:first_name]).to include("can't be blank")
    end

    it 'should not be created if last_name is nil' do
      @user_spec[:last_name] = nil
      @user = User.new(@user_spec)
      @user.save
      expect(@user.errors[:last_name]).to include("can't be blank")
    end

    it 'should not be created if password length is less than 5' do
      @user_spec[:password] = '1234'
      @user_spec[:password_confirmation] = '1234'
      @user = User.new(@user_spec)
      @user.save
      expect(@user.errors[:password]).to include('is too short (minimum is 5 characters)')
    end
  end

  describe '.authenticate_with_credentials' do
    context 'given an email that does not exist in users table' do
      it 'should return nil' do
        @user = User.authenticate_with_credentials('unknown_email@test.com', '12345')
        expect(@user).to be_nil
      end
    end
    context 'given an incorrect password for the input email' do
      it 'shoudl return nil' do
        @user = User.authenticate_with_credentials('test@test.com', '123412315')
        expect(@user).to be_nil
      end
    end

  end
end
