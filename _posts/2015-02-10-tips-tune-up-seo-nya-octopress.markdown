---
layout: post
title: "Tips tune-up SEO-nya Octopress"
date: 2015-02-10 17:28:50 +0700
comments: true
categories: [octopress] 
keywords: octopress,seo,sitemap,permalinks
description: Tips sederhana meningkatkan SEO blog site berbasis Octopress 
---
Octopress 2.0 secara default belum teroptimalisasi untuk mengikuti kaidah-kaidah search engine optimizations (SEO) yang baik. Berikut adalah sedikit modifikasi belajaran yang saya coba lakukan untuk meningkatkan SEO dari blog berbasis Octopress :
### 1. Menghilangkan /blog/ pada permalinks standar Octopress
Permalinks default Octopress adalah dalam format `/blog/:year/:month/:day/:title/` sehingga ada di dalam URL permalinks mengandung kata /blog/ yang berulang untuk artikel. Hal ini kurang bagus untuk SEO karena URL permalink akan lebih panjang dengan satu keyword direktori yang berulang untuk semua artikel. Sebagaimana yang disarankan di [10 Best SEO Practices for URLs and Blog Permalinks]({{ 'https://blog.dashburst.com/url-permalink-seo-best-practices/' | bitly }})
  
Untuk menghilangkan /blog/ dalam permalinks Octopress cukup mudah, caranya:
1. Ubah setting permalinks di file `_config.yml` menjadi `permalink: /:year/:month/:day/:title/`

2. Pindah direktori `./source/blog/archives/` dan seluruh isinya ke `./source/archives/` 

3. <span class="label label-danger">Penting!</span> hapuslah direktori kosong `./source/blog/`

4. Sesuaikan tautan "Archives"  di `./source/_includes/custom/navigation.html`

5. Sesuaikan tautan "Blog Archives" di `./source/index.html`

Sebenarnya `/blog/` sudah di hilangkan dalam rilis Octopress versi 2.1 namun sayangnya versi 2.1 sudah dihapus dari branch Github. 

### 2. ping/notify otomatis sitemap ke Google, Bing dan Ping-o-Matic
Octopress sendiri telah secara otomatis meng-generate sitemap dalam bentuk sitemap.xml dan atom.xml setiap kita menjalankan perintah `rake generate`. Namun sayang kita harus secara manual melakukan sitemap refresh ke masing-masing search engine agar situs kita dapat di index, tentunya ini amat sangat merepotkan. Oleh karenanya terinspirasi dari https://gist.github.com/1709714, saya memodifikasi `Rakefile` dengan menambahkan fungsi baru yaitu `notify` untuk melakukan ping ke Google, Bing dan Ping-o-Matic untuk notifikasi sitemap refresh dengan menjalankan perintah `rake notify` setelah proses deploy selesai.

{% highlight ruby %}
#
# Notify sitemap to ping services
#
desc 'Ping pingomatic'
task :pingomatic do
  begin
    require 'xmlrpc/client'
    puts '* Pinging ping-o-matic'
    XMLRPC::Client.new('rpc.pingomatic.com', '/').call('weblogUpdates.extendedPing', 'Ewal.net' , 'http://prana.la', 'http://prana.la/atom.xml')
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
{% endhighlight %}

Bila anda ingin menotifikasi ping services secara otomatis setiap selesai menjalankan perintah `rake gen_deploy`, tambahkan baris berikut di bagian akhir peritah `gen_deploy` di `Rakefile` :
{% highlight ruby %}
task :gen_deploy => [:integrate, :generate, :deploy, :notify] do
{% endhighlight %}

### 3. Modifikasi meta tags situs
Meskipun dalam `_config.yml` sudah kita isi semua data meta tag title, description dan keywords situs, ternyata di file template `./source/_includes/head.html` informasi tersebut tidak diparsing dengan semestinya sehingga tidak dicantumkan di laman web, tentulah hal ini akan sangat mengurangi nilai SEO.

{% highlight html %}
{% raw %}
  <title>{% if page.title %}{% if site.titlecase %}{{ page.title | titlecase }}{% else %}{{ page.title }}{% endif %} - {% endif %}{{ site.title }} &ndash; {{ site.subtitle }}</title>
  <meta name="author" content="{{ site.author }}">
  <meta name="description" content="{{ site.description | truncate:200 }}">
  <meta name="keywords" content="{{ site.keywords | truncate:150 }}">
{% endraw %}
{% endhighlight %}



