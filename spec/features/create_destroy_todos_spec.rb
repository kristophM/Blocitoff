require 'rails_helper'

describe "Create Todos" do
 describe "successful" do
   it "shows new todo items" do
     @user = create(:user)
     login_as(@user, :scope => :user)
     visit user_path(@user)

     within '.new-item' do
       fill_in 'item_name', with: 'blah blah blah blah blah'
     end

     within 'form' do
       click_button 'Save'
     end

     page.has_content?('blah blah blah blah blah')

   end
 end
end

describe "Destroy Todos" do
 describe "successful" do
   it "causes item to disappear upon clicking" do
     @user = create(:user)
     item = create(:item)
     item.user = @user
     login_as(@user, :scope => :user)
     visit user_path(@user)

     find(:xpath, "//a[@id='item-#{item.id}']").click
     #click_link("item-#{item.id}")

     page.should have_no_content("Test item entry blah blah blah")

   end
 end
end
