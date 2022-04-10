# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InquiryForm, type: :model do
  let :inquiry_form do
    build(:inquiry_form)
  end

  describe 'バリデーションについて' do
    subject do
      inquiry_form
    end

    it 'バリデーションが通ること' do
      expect(subject).to be_valid
    end

    describe 'name' do
      context '値がない時' do
        let :inquiry_form do
          build(:inquiry_form, name: nil)
        end

        it 'バリデーションエラーになること' do
          expect(subject).to be_invalid
        end
      end
    end

    describe 'content' do
      context '値がない時' do
        let :inquiry_form do
          build(:inquiry_form, name: nil)
        end

        it 'バリデーションエラーになること' do
          expect(subject).to be_invalid
        end
      end

      context '値が4000文字以上の時' do
        let :inquiry_form do
          build(:inquiry_form, content: 'a' * 4001)
        end

        it 'バリデーションエラーになること' do
          expect(subject).to be_invalid
        end
      end
    end

    describe 'type' do
      context '値がない時' do
        let :inquiry_form do
          build(:inquiry_form, type: nil)
        end

        it 'バリデーションエラーになること' do
          expect(subject).to be_invalid
        end
      end

      context '値が指定値以外の時' do
        let :inquiry_form do
          build(:inquiry_form, type: 'test')
        end

        it 'バリデーションエラーになること' do
          expect(subject).to be_invalid
        end
      end
    end

    describe 'email' do
      context '値がない時' do
        let :inquiry_form do
          build(:inquiry_form, email: nil)
        end

        it 'バリデーションエラーになること' do
          expect(subject).to be_invalid
        end
      end

      context '@がない時' do
        let :inquiry_form do
          build(:inquiry_form, email: 'testexample.com')
        end

        it 'バリデーションエラーになること' do
          expect(subject).to be_invalid
        end
      end

      context 'その他のパターンはgem email_validatorを信頼'
    end
  end
end
