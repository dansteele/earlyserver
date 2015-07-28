require 'faker'

FactoryGirl.define do
  factory :user do
    name Faker::Name.name
    passwprd  Faker::Internet.password(8)
  end
end