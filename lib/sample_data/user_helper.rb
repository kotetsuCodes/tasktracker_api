module SampleData
  module UserHelper
    def self.create_users(method, count = 5)
      users = []
      count.times.each do |x|
        users << send(method)
      end
      users
    end

    def self.create_user(email: "task_user-#{rand(1..1000)}@mailinator.com")
      name = "#{Faker::Name.first_name} #{Faker::Name.last_name}"

      user = User.create!(
          #name: name,
          email: email,
          #phone: Faker::PhoneNumber.phone_number,
          password: Global.sample_data.default_password,
      )
      puts "User #{user.email} created"
      user
    end
  end

end