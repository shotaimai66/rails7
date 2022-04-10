# frozen_string_literal: true

FactoryBot.define do
  factory :inquiry_form do
    name { '山田太郎' }
    sequence(:email) { |n| "admin#{n}@example.com" }
    type { InquiryForm::TYPE[:'システムの不具合'] }
    content do
      <<~MSG
        システムの要望についてのお問い合わせです。
        こちらのシステム最高です！
      MSG
    end
  end
end
