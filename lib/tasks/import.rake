task :import  => :environment do
  IMAGE_PATH = "/Users/xcm/Code/work/game_studio/sisihui/images"
  Dir.glob(IMAGE_PATH + "/*").each do |dir|
    next if File.file?(dir)
    puts File.basename(dir)
    c = Category.create(:name => File.basename(dir))
    Dir.glob(dir + "/*").each do |file|
      puts file
      c.resources.create(:name => File.basename(file), :storage => File.open(file)) 
    end
  end
end
