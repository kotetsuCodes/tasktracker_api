namespace :db do
  desc 'Drop, create, migrate, seed and populate sample data'
  task prepare: [:reset, :populate_sample_data] do
    puts 'Ready to go!'
  end

  task :populate_sample_data do
    require 'sample_data/sample_data'

    users = SampleData::UserHelper.create_users(:create_user)
    task_categories = SampleData::TaskCategoryHelper.create_task_categories(users)
    tasks = SampleData::TaskHelper.create_tasks(users)
  end
end