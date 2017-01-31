FactoryGirl.define do
  factory :user do
    uid "44444"
    name Faker::GameOfThrones.character
    token "abunchofbs"
  end
end
