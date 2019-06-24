FactoryBot.define do
  
  factory :user do
    name {"This is my name"}
    bio {"This is my bio"}
    email { Faker::Internet.email }
    password { "1234567" }
  end

  factory :post do 
    user
    content {"This is factory content of a post"}
  end

  factory :comment do 
    user
    post
    content {"Yay this is a factory comment"}
  end

  factory :like do 
    user
    post
  end

  factory :friendship do 
    sender {build(:user)}
    reciever {build(:user)}
    status { 0 }
  end

end