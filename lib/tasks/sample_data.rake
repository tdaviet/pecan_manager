namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    @company = Company.create!(:name => "John Doe Farms")
    admin = User.create!(#:name => "Example User",
                 :email => "example@railstutorial.org",
                 :password => "foobar",
                 :password_confirmation => "foobar",
                 :company_id => @company.id)
    admin.toggle!(:admin)
    99.times do |n|
      #name  = Faker::Name.name
      @company = "Example Company-#{n+1}"
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      @company_id = Company.create!(:name => @company)
      User.create!(#:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password,
                   :company_id => @company_id.id)
    end
  end
end
