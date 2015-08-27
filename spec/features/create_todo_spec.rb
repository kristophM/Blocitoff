require 'rails_helper'

 describe "Sign in flow" do

   include TestFactories

   describe "successful" do
     it "redirects to the user#show view" do
       user = authenticated_user
       visit root_path

       within '.nav.navbar-nav' do
         click_link 'Sign In'
       end
       fill_in 'Email', with: user.email
       fill_in 'Password', with: user.password

       within 'form' do
         click_button 'Log in'
       end

       expect(current_path).to eq user_path
     end
   end
 end
