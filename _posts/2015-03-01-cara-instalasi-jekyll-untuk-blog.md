---
layout: post
title: Panduan instalasi Jekyll untuk ngeblog
date: 2015-03-01 19:12:44 +0700 
comments: true
categories: jekyll
sitemap:
  lastmod: 
  changefreq: weekly
  priority: 0.7
---

Panduan singkat ini berasumsi anda telah menginstal Ruby dengan benar, rekomendasi pakai Ruby versi 1.9.x saja. Versi Ruby yg saya gunakan adalah: 
{% highlight sh %}
ruby 1.9.3p484 (2013-11-22 revision 43786)
{% endhighlight %}
Step by step cara instalasi Ruby secara singkat dapat dilihat di [Catatan install Octopress Ubuntu](http://prana.la/2015/01/04/octopress-di-ubuntu/)

Menyiapkan direktori standar Jekyll seperti yang diarahkan di dokumentasi [Jekyll](http://jekyllrb.com/docs/structure/) atau kalau nggak mau repot, silakan clone [Kyllstrap](https://github.com/kurnias/kyllstrap) dari Github.

Mengingat  saya coba untuk merapikan gems Ruby yang sudah tidak lagi digunakan. Langkah pertama adalah menghapus terlebih dahulu semua gems Ruby yang terpasang saat instalasi Octopress dengan perintah:
{% highlight sh %}
sudo gem list --no-version | xargs sudo gem uninstall -ax
{% endhighlight %}
Setelah itu kita membuat `Gemfile` sbb:
{% highlight sh %}
source "https://rubygems.org"
gem 'rake', '~> 10.0'
gem 'jekyll', '~> 2.0'
{% endhighlight %}
Secara default, Jekyll menggunakan gem `kramdown` untuk parsing Markdown, oleh karenanya parameter markdown di  `_config.yml` saya ganti dari `rdiscount` ke `kramdown`. Selanjutnya untuk mempermudah management dependensi kita gunakan gem bundler, untuk itu install dulu bundler nya:
{% highlight sh %}
sudo gem install bundler
{% endhighlight %}
dan lanjutkan dengan perintah:
{% highlight sh %}
bundle install
{% endhighlight %}
<span class="label label-info">Ingat</span> jalankan perintah diatas tanpa `sudo` bundler akan meminta password root apabila memang dibutuhkan. 


