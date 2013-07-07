require 'open3'
require "httparty"

class Client
  include HTTParty

  headers 'User-Agent' => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36"
end

task :translate => [:environment] do
  url  =   " http://translate.google.com/translate_a/t?client=t&hl=en&sl=auto&tl=en&ie=UTF-8&oe=UTF-8&oc=1&otf=2&srcrom=1&ssel=0&tsel=0&uptl=en&alttl=zh-CN&sc=1&q="
  Gallery.find_in_batches(:batch_size => 20) do |galleries|
    galleries.each do |g|
      begin
        res = Client.get url + CGI.escape(g.name)
        g.en_name = res.body.split("\"")[1]
        puts "from #{g.name} to #{g.en_name}"
        g.save
      rescue 
        sleep 10
        retry
      end
    end

  end
end
