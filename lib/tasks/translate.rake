require 'open3'
require "httparty"

class Router
  include HTTParty
  base_uri 'http://192.168.0.1'

  def initialize(u, p)
    @auth = {:username => u, :password => p}
  end

  def restart
    options = { :body => {"CMD" => "reboot", "GO"=>"tools_system.asp"}, :basic_auth => @auth }
    self.class.post('/apply.cgi', options)
  end

  def current_global_ip
    system("curl ifconfig.me")
  end
end

r = Router.new("admin", "xuchunming")

class Client
  include HTTParty

  headers 'User-Agent' => "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36"
end

task :translate => [:environment] do
  url  =   " http://translate.google.com/translate_a/t?client=t&hl=en&sl=auto&tl=en&ie=UTF-8&oe=UTF-8&oc=1&otf=2&srcrom=1&ssel=0&tsel=0&uptl=en&alttl=zh-CN&sc=1&q="
  Gallery.find_in_batches(:batch_size => 20) do |galleries|
    galleries.each do |g|
      next if g.en_name
      res = Client.get url + CGI.escape(g.name)
      g.en_name = res.body.split("\"")[1]
      puts "from #{g.name} to"
      puts g.en_name
      g.save
    end

  end
end
