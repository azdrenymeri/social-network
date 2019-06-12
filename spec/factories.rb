FactoryBot.define do
  
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Name.name }
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
    reciever {build(:user,email:"janed.doe@example.com",password:"thisismypassword")}
  end

end