require 'rails_helper'

RSpec.describe 'InquiryForm', type: :system do
  describe 'お問い合わせの投稿' do
    context 'お問い合わせの投稿' do
      it '投稿できること' do
        visit inquiry_new_path
        fill_in 'inquiry[name]', with: '山田太郎'
        fill_in 'inquiry[email]', with: 'test@example.com'
        select 'システムの不具合', from: 'Type'
        fill_in 'inquiry[content]', with: 'お問い合わせ内容'
        click_button '送信する'
        expect(page).to have_content 'お問い合わせを送信いたしました'
      end
    end

    context 'emailの値が不正の時' do
      it '投稿できないこと' do
        visit inquiry_new_path
        fill_in 'inquiry[name]', with: '山田太郎'
        fill_in 'inquiry[email]', with: 'testexample.com'
        select 'システムの不具合', from: 'Type'
        fill_in 'inquiry[content]', with: 'お問い合わせ内容'
        click_button '送信する'
        expect(page).to have_content 'お問い合わせの送信に失敗しました'
      end
    end
  end
end
