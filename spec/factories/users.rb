FactoryGirl.define do
  factory :user do
    uid "44444"
    login "Dpalazzari"
    name Faker::GameOfThrones.character
    token "abunchofbs"
    avatar Faker::Avatar.image
  end
end
