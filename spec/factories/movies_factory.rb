FactoryGirl.define do
  factory :movie do
    title Faker::Lorem.sentence
    description Faker::Lorem.paragraphs(3)
    release_date Faker::Date.backward(days = 1825)
    gross Faker::Number.between(from = 1, to = 5000000)
    mpaa_rating {['G', 'PG', 'PG-13', 'R', 'NC-17'].sample }
  end
end
