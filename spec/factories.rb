FactoryBot.define do
  
  factory :user do
    email {"john.doe@example.com"}
    password {"thisismypassword"}
  end

  factory :post do 
    user
    title {"Yay factory post"}
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