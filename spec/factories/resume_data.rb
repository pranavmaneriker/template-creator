# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :resume_data do
    resume_id 1
    field "MyString"
    data "MyString"
  end
end
