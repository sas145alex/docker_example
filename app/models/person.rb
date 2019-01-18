class Person < ApplicationRecord
  def self.create_random
    person = Person.new
    person.fn = Faker::Name.name
    person.ln = Faker::Name.name
    person.email = Faker::Internet.email
    person
  end
end
