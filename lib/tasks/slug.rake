task :slug => :environment do
  Gallery.all.each do |g|
    next if g.en_name.nil?
    g.slug = g.en_name.sub(/[,|`|']/, "").gsub(" ", "-")
    puts g.slug
    g.save
  end
end
