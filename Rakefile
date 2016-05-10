require 'time'
require 'rake'
require 'yaml'
require 'fileutils'
require 'rbconfig'

class String
def black;          "\033[30m#{self}\033[0m" end
def red;            "\033[31m#{self}\033[0m" end
def green;          "\033[32m#{self}\033[0m" end
def brown;          "\033[33m#{self}\033[0m" end
def blue;           "\033[34m#{self}\033[0m" end
def magenta;        "\033[35m#{self}\033[0m" end
def cyan;           "\033[36m#{self}\033[0m" end
def gray;           "\033[37m#{self}\033[0m" end
def bg_black;       "\033[40m#{self}\033[0m" end
def bg_red;         "\033[41m#{self}\033[0m" end
def bg_green;       "\033[42m#{self}\033[0m" end
def bg_brown;       "\033[43m#{self}\033[0m" end
def bg_blue;        "\033[44m#{self}\033[0m" end
def bg_magenta;     "\033[45m#{self}\033[0m" end
def bg_cyan;        "\033[46m#{self}\033[0m" end
def bg_gray;        "\033[47m#{self}\033[0m" end
def bold;           "\033[1m#{self}\033[22m" end
def reverse_color;  "\033[7m#{self}\033[27m" end
end

# == Configuration =============================================================

# Set "rake watch" as default task
task :default => :help

# Load the configuration file
CONFIG = YAML.load_file("_config.yml")

# Get and parse the date
DATE = Time.now.strftime("%Y-%m-%d")
POST_TIME = Time.now

# Directories
POSTS = "_posts"
DRAFTS = "_drafts"
SITES = "_site"

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

## -- Helper Functions -- ##

# Execute a system command
def execute(command)
  system "#{command}"
end

# Check the title
def check_title(title)
  if title.nil? or title.empty?
    raise "Please add a title to your file."
  end
end

# Transform the filename and date to a slug
def transform_to_slug(title, extension)
  characters = /("|'|!|\?|:|\s\z)/
  whitespace = /\s/
  "#{title.gsub(characters,"").gsub(whitespace,"-").downcase}.#{extension}"
end

# Read the template file
def read_file(template)
  File.read(template)
end

# Save the file with the title in the YAML front matter
def write_file(content, title, directory, filename)
  parsed_content = "#{content.sub("title:", "title: \"#{title}\"")}"
  parsed_content = "#{parsed_content.sub("date:", "date: #{POST_TIME}")}"
  File.write("#{directory}/#{filename}", parsed_content)
  puts "#{filename} was created in '#{directory}'."
end

# Create the file with the slug and open the default editor
def create_file(directory, filename, content, title, editor)
  FileUtils.mkdir(directory) unless File.exists?(directory)
  if File.exists?("#{directory}/#{filename}")
    raise "The file already exists."
  else
    write_file(content, title, directory, filename)
    if editor && !editor.nil?
      sleep 1
      execute("#{editor} #{directory}/#{filename}")
    end
  end
end

desc "Helper"
task :help do
  puts 'rake write["title"] to create new post'
  puts 'rake clean'
  puts 'rake build'
  puts 'rake deploy'
  puts 'rake all'
end

desc "Deploy website via rsync portability fixed"
task :rsync do
  system("rsync -avz --chmod=u=rwX,go=rX -e 'ssh -p #{ssh_port}' #{rsync_args} #{"--delete" unless rsync_delete == false} #{SITES}/ #{ssh_user}:#{document_root}")
end

desc "Clean"
task :clean do
  rm_rf '_site'
  FileList['**/*~'].clear_exclude.each do |f|
    rm_f f
  end
end

desc "delete root index.html"
task :unindex do
    rm_f '_site/index.html'
    rm_f '_site/atom.xml'
    rm_f '_site/sitemap.xml'
end


desc "build the site"
task :build do
  sh "bundle exec jekyll build --incremental"
end

desc 'create a new draft post'
task :write, :title do |t, args|
  title = args[:title]
  template = CONFIG["post"]["template"]
  editor = CONFIG["editor"]
  check_title(title)
  filename = "#{DATE}-#{transform_to_slug(title, 'md')}"
  content = read_file(template)
  create_file(POSTS, filename, content, title, editor)
end

#
# Notify sitemap to ping services
#
desc 'Ping pingomatic'
task :pingomatic do
  begin
    require 'xmlrpc/client'
    puts '* Pinging ping-o-matic'.bold.brown
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
    puts '* Pinging Google about our sitemap'.bold.brown
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
    puts '* Pinging Bing about our sitemap'.bold.brown
    Net::HTTP.get('www.bing.com', '/webmaster/ping.aspx?siteMap=' + URI.escape('http://prana.la/sitemap.xml'))
  rescue LoadError
    puts '! Could not ping Bing about our sitemap, because Net::HTTP or URI could not be found.'
  end
end

desc "Notify various services about new content"
task :notify => [:pingomatic, :sitemapgoogle, :sitemapbing] do
end

desc 'Rake the world'
task :world => [:clean, :build, :rsync, :notify] do
end

desc 'Rake build incremental'
task :all =>[:unindex, :build, :rsync, :notify] do
end
