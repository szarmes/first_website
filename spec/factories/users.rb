FactoryGirl.define do
  factory :user do
    name "testname"
    email "test1@email.com"
    password "foobarfoobar"
    password_confirmation "foobarfoobar"
    admin true
  end
end