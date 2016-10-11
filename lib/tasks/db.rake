namespace :db do
  desc 'Fill the database with data for develpment'
  task fake_data: :environment do
    load Rails.root.join('db/fake_data.rb')
  end
end
