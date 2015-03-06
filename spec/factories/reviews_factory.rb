FactoryGirl.define do
  factory :comment do
    comments Faker::Lorem.paragraphs(3)
    star_rating Faker::Number.between(from = 1, to = 5)
    username Faker::Name.name
    movie
  end
end
