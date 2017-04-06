module SampleData
  module TaskHelper
    def self.create_tasks(users, count = 10)
      tasks = []
      count.times.each do |t|
        tasks << create_task(users.sample)
      end

      tasks
    end

    def self.create_task(user)
      task = user.tasks.create!(
        name: Faker::Food.ingredient,
        content: Faker::StarWars.quote,
        status: Faker::Number.between(0, 1),
        priority: Faker::Number.between(1, 10)
      )
      puts "Task #{task.name} created"
      task
    end
  end
end
