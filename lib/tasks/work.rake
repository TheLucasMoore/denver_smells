namespace :jobs do
  desc 'Pull Data from WU'
  task :work => :environment do
    ApplicationJob.new.perform
  end
end
