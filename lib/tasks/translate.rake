require 'open3'

task :translate => [:environment] do

  curl = "curl -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36'"
  url  =   " http://translate.google.com/translate_a/t?client=t&hl=en&sl=auto&tl=en&ie=UTF-8&oe=UTF-8&oc=1&otf=2&srcrom=1&ssel=0&tsel=0&uptl=en&alttl=zh-CN&sc=1&q="
  Gallery.find_in_batches do |galleries|
    galleries.each do |g|
      next if g.en_name
      Open3.popen3("curl", "-H", "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_4) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36",  url + CGI.escape(g.name)) do |i, o|
        i.close
        puts o.read
        #puts curl + url + CGI.escape(g.name)
        puts "from #{g.name} to #{g.en_name}"
        #g.save
      end
      break
    end
  end
end
