FactoryBot.define do
    factory :user do
        name { "TestUser" }
        # テスト用のオブジェクトが生成される度に一意の値を生成してくれる
        sequence(:email) { |n| "test#{n}@example.com" }
        password { "foobar" }
        password_confirmation { "foobar" }
    end
end