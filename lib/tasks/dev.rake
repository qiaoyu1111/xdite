namespace :dev do
  desc "drop database;create database;migrate;seeds"
  task :build => ["tmp:clear","log:clear","db:drop","db:create","db:migrate"]
  task :rebuild => ["dev:build","db:seed"]
end