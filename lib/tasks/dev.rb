namespace :dev do
  desc "drop database;create database;migrate;seeds"
  task :task_name => [:dependent, :tasks] do
    
  end
end