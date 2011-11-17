namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    Company.create!(:name => "John Doe Farms")
    1.times do
      Company.all.each do |company|
        admin = company.users.create!(#:name => "Example User",
                   :email => "example@railstutorial.org",
                   :password => "foobar",
                   :password_confirmation => "foobar")
        admin.toggle!(:admin)
      end
    end

    5.times do |n|
      #name  = Faker::Name.name
      @company = "Example Company-#{n+1}"
      Company.create!(:name => @company)
    end

      n = 0
      Company.all.each do |company|

          email = "example-#{n+1}@railstutorial.org"
          password  = "password"
            company.users.create!(#:name => name,
                       :email => email,
                       :password => password,
                       :password_confirmation => password)
          n = n + 1
      end

        2.times do
          Company.all(:limit => 3).each do |company|
            company.farms.create!(:farm_name => Faker::Lorem.sentence(1))
          end
        end

        2.times do |x|
          Farm.all(:limit => 4).each do |farm|
            farm.blocks.create!(:block_number => "#{x+1}")
          end
        end
  end
end
