module SampleData
  module TaskCategoryHelper
    def self.create_task_categories(users, count = 5)
      task_categories = []
      count.times.each do |x|
        task_categories << create_task_category(users.sample)
      end

      task_categories
    end

    def self.create_task_category(user)
      task_category = user.task_categories.create!(
        name: Faker::Food.ingredient
      )
      puts "Task Category #{task_category.name} created"
      task_category
    end
  end
end
