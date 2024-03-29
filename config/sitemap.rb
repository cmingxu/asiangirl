# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.hottestasiangirl.com"

SitemapGenerator::Sitemap.create do
  add("/", :changefreq => "daily", :priority => 0.8)
  add("/about", :changefreq => "weekly", :priority => 0.5)
  add("/galleries", :changefreq => "weekly", :priority => 0.8)
  100.times do |i|
    add("/galleries?page=#{i}", :changefreq => "daily", :priority => 0.8)
  end

  Gallery.all.each do |g|
    add("/galleries/#{g.to_param}", :changefreq => "daily", :priority => 0.8)
  end


  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end
end
