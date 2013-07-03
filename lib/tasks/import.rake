task :import  => :environment do
  IMAGE_PATH = "/Users/xcm/Code/work/game_studio/sisihui/images"

  Dir.glob(IMAGE_PATH + "/*").each do |dir|
    next if File.file?(dir)
    puts File.basename(dir)
    tcount = Thread.list.count
    threads = []
    c = Gallery.create(:name => File.basename(dir))
    Dir.glob(dir + "/*").each do |file|
      threads << Thread.new do
        c.resources.create(:name => File.basename(file), :storage => File.open(file)) 
        puts file
      end
    end


    loop do
      sleep 0.1
      threads.map(&:join)
      if Thread.list.count == tcount 
        break
      end
    end


    puts threads.size
  end
end
