require "twitter"

task :twitter => :environment do
  Twitter.configure do |config|
    config.consumer_key = "bjS6stx40oYBrHB8BRRIQ"
    config.consumer_secret = "7qmsPNqyjgFOOueFE1qMG5O7PWZYhJRZz9bPiwlmy0"
    config.oauth_token = "egergregreergregregregre"
    config.oauth_token_secret = "ergreeeeeeeeegggggergrfwecwegtrhryjht"
  end


  Twitter.update("I'm tweeting with @gem!")
end
