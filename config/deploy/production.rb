role :web, "23.23.90.129"                          # Your HTTP server, Apache/etc
role :app, "23.23.90.129"                          # This may be the same as your `Web` server
role :db,  "23.23.90.129", :primary => true # This is where Rails migrations will run
role :db,  "23.23.90.129"

set :rails_env, "production"
