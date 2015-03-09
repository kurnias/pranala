require 'time'


## -- Rsync Deploy config -- ##
# Be sure your public key is listed in your server's ~/.ssh/authorized_keys file
# or you have to enter your password every deployment.
#
ssh_user       = "u10187ams@prana.la"
ssh_port       = "22"
document_root  = "~/domain/prana.la/prana.la/web/"
rsync_delete   = true
rsync_args     = ""  # Any extra arguments to pass to rsync
deploy_default = "rsync"

# Misc.
site_dir       = "_site"

desc "Deploy website via rsync"
task :rsync do
  puts "## Deploying website via Rsync please standby.."
  system("rsync -avze 'ssh -p #{ssh_port}' #{rsync_args} #{"--delete" unless rsync_delete == false} #{site_dir}/ #{ssh_user}:#{document_root}")
end

desc "clean"
task :clean do
  puts "## Clean up build directory ..."
  rm_rf '_site'
  FileList['**/*~'].clear_exclude.each do |f|
    rm_f f
  end
end

desc "build the site"
task :build do
  puts "## Building the site ..."
  sh "bundle exec jekyll build"
end

desc 'create a new draft post'
task :post do
    title = ENV['TITLE']
    slug = "#{Date.today}-#{title.downcase.gsub(/[^\w]+/, '-')}"

    file = File.join(
        File.dirname(__FILE__),
        '_posts',
        slug + '.md'
    )

    File.open(file, "w") do |f|
        f << <<-EOS.gsub(/^     /, '')
     ---
     layout: post
     title: #{title}
     date: #{DateTime.now.strftime('%Y-%m-%d %H:%M:%S %z')} 
     comments: true
     categories:
     sitemap:
       lastmod: 
       changefreq: weekly
       priority: 0.7
     ---

        EOS
    end

    system ("#{ENV['EDITOR']} #{file}")
end

#
# Notify sitemap to ping services
#
desc 'Ping pingomatic'
task :pingomatic do
  begin
    require 'xmlrpc/client'
    puts '* Pinging ping-o-matic'
    XMLRPC::Client.new('rpc.pingomatic.com', '/').call('weblogUpdates.extendedPing', 'prana.la' , 'http://prana.la', 'http://prana.la/sitemap.xml')
  rescue LoadError
    puts '! Could not ping ping-o-matic, because XMLRPC::Client could not be found.'
  end
end

desc 'Notify Google of the new sitemap'
task :sitemapgoogle do
  begin
    require 'net/http'
    require 'uri'
    puts '* Pinging Google about our sitemap'
    Net::HTTP.get('www.google.com', '/webmasters/tools/ping?sitemap=' + URI.escape('http://prana.la/sitemap.xml'))
  rescue LoadError
    puts '! Could not ping Google about our sitemap, because Net::HTTP or URI could not be found.'
  end
end

desc 'Notify Bing of the new sitemap'
task :sitemapbing do
  begin
    require 'net/http'
    require 'uri'
    puts '* Pinging Bing about our sitemap'
    Net::HTTP.get('www.bing.com', '/webmaster/ping.aspx?siteMap=' + URI.escape('http://prana.la/sitemap.xml'))
  rescue LoadError
    puts '! Could not ping Bing about our sitemap, because Net::HTTP or URI could not be found.'
  end
end

desc "Notify various services about new content"
task :notify => [:pingomatic, :sitemapgoogle, :sitemapbing] do
end

desc 'Rake the world'
task :all => [:clean, :build, :rsync, :notify] do
end


