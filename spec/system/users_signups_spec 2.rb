require 'rails_helper'

# systemスペックはブラウザ操作を必要とする時
RSpec.describe "UsersSignups", type: :system do
    scenario 'Don\'t create new data when user submits invalid information' do
        visit signup_path
        fill_in 'Name', with: ' '
        fill_in 'Email', with: 'user@invalid'
        fill_in 'Password', with: 'foo'
        fill_in 'Confirmation', with: 'bar'
        click_on 'Create my account'
        # aggregate_failuresは失敗の有無に関係なくブロックで囲まれたエクスペクテーションを全て実行
        aggregate_failures do
            expect(current_path).to eq signup_path  
            expect(page).to have_content 'Sign up'
            expect(page).to have_content 'The form contains 4 errors' 
            expect(page).to have_content 'Name can\'t be blank' 
            expect(page).to have_content 'Email is invalid' 
            expect(page).to have_content 'Password confirmation doesn\'t match Password' 
            expect(page).to have_content 'Password is too short (minimum is 6 characters)' 
            expect(page).to have_content '' 
        end
    end
end
