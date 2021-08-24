require 'rails_helper'
RSpec.describe 'ユーザーの登録', type: :system do
  describe 'ユーザー登録機能' do
    context 'ユーザーを新規登録した場合' do
      it '登録したユーザーが表示されること' do
        visit new_user_registration_path
        fill_in 'user[name]', with: 'aaa'
        fill_in 'user[email]', with: 'aaa@aaa.com'
        fill_in 'user[password]', with: 'aaaaaa'
        fill_in 'user[password_confirmmation]', with: 'aaaaaa'
        click_button 'Sign up'
        expect(page).to have_content 'aaa'
      end
    end

      context 'ユーザーがログインせずにユーザーページの飛ぼうとしたとき' do
        it 'ログイン画面に遷移する' do
          visit user_path
          expect(page).to have_content '登録'
          expect(page).to have_content 'ログイン'
        end
      end
    end

    describe 'セッション機能' do
      before do
        @user1 = FactoryBot.create(:user)
        @user2 = FactoryBot.create(:second_user)
        @user3 = FactoryBot.create(:third_user)
      end
      context 'ユーザーが登録されている場合' do
        it 'ログインができる' do
          visit new_session_path
          fill_in 'session[email]', with: 'test100@test.com'
          fill_in 'session[password]', with: 'test100test100'
          click_button 'commit'
          expect(page).to have_content 'test100'
          expect(current_path).to eq user_path(id: @user.id)
        end

        context 'ログアウトができる' do
          visit
        end
      end
    end
  end