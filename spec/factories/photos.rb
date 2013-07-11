# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :photo do
    name "Catherine"
    picture File.open(File.join(Rails.root, '/public/final_3.jpg'))
  end
end
