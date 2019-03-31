FactoryBot.define do
    factory :user do
        name { Faker::Name.name }
        email { 'foo@bar.com' }
        password { 'hogehoge' }
    end
end