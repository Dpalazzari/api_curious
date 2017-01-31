FactoryGirl.define do
  factory :user do
    uid "44444"
    login 'dpalazzari'
    name Faker::GameOfThrones.character
    token "abunchofbs"
  end
end
