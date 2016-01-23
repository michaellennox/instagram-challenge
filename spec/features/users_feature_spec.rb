require 'rails_helper'

RSpec.feature 'Users Features' do
  context 'when user is not signed in' do
    scenario 'they should not see link for sign out' do
      visit '/'

      expect(page).not_to have_link 'Sign Out'
    end

    scenario 'they should be able to sign up for an account' do
      visit '/'
      click_link 'Sign Up'
      fill_in :user_email, with: 'test@example.com'
      fill_in :user_password, with: 'testtest'
      fill_in :user_password_confirmation, with: 'testtest'
      click_button 'Sign up'

      expect(page).to have_content 'test@example.com'
      expect(page).to have_content 'You have signed up successfully'
    end

    scenario 'they should be able to sign in to an existing account' do
      user = FactoryGirl.create(:user)

      visit '/'
      click_link 'Sign In'
      fill_in :user_email, with: user.email
      fill_in :user_password, with: user.password
      click_button 'Log in'

      expect(page).to have_content user.email
      expect(page).to have_content 'Signed in successfully'
    end
  end

  context 'when user is signed in' do
  end
end
