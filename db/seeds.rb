fixtures = [{:login => "cmingxu", :email => "cming.xu@gmail.com", :password => "admin1111", :password_confirmation => "admin1111", :roles => "admin"},
{:login => "alex", :email => "alex@gmail.com", :password => "admin1111", :password_confirmation => "admin1111", :roles => "account"},
{:login => "pavel", :email => "pavel@gmail.com", :password => "admin1111", :password_confirmation => "admin1111", :roles => "account paid"}]

begin
fixtures.each do |u|
  User.create! u
end
rescue
end

["Stuff Pics", "Top Galleries", "Guess You Like"].each do |cate|
  Category.create :name => cate, :slug => cate.sub(" ", "_").underscore
end
