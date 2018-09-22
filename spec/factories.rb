# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    position "MyString"
    user nil
  end
  factory :employment do
    position "MyString"
    company nil
    user nil
  end
  factory :company do
    unp '123456789'
    name 'Example company'
    user
  end
  factory :user do
    id 1 # smells like smb. tried to conform it with helper's id
    email     'user@example.com'
    password  'password'
  end
end