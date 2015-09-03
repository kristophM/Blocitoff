require 'rails_helper'

describe "Sign in flow" do
 describe "successful" do
   it "redirects to the users#show view and contain appropriate content" do
     @user = create(:user)
     visit root_path

     within '.nav.navbar-nav' do
       click_link 'Sign In'
     end
     fill_in 'Email', with: @user.email
     fill_in 'Password', with: @user.password

     within 'form' do
       click_button 'Log in'
     end

     expect(current_path).to eq user_path(@user)
     page.has_css?('.media.list-group-item')
     page.has_content?('User Information')
     page.has_content?('ID: /\d/')
     page.has_content?('Email:')
     page.has_content?('Member since:')
   end
 end
end

describe "Sign out flow" do
  describe "successful" do
    it "redirects to the welcome#index view" do
      @user = create(:user)
      login_as(@user, :scope => :user)
      visit user_path(@user)

      within '.nav.navbar-nav' do
        click_link 'Sign Out'
      end

      page.has_content?('Sign In')
    end
  end
end
