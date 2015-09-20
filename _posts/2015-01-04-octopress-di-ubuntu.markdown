---
layout: post
title: "Catatan install Octopress Ubuntu"
date: 2015-01-04 20:42:18 +0700
comments: true
categories: octopress
---
<div class="alert alert-info" role="alert">Update: saya sudah tidak lagi menulis blog ini dengan Octopress, artikel ini hanya untuk referensi saja.</div>

Instalasi <code>Octopress</code> di Ubuntu, sebelum menjalankan step-by-step instruksi 
di dokumentasinya, ada beberapa langkah tambahan yang perlu dilakukan agar 
instalasi berjalan mulus

{% highlight Bash %}
sudo apt-get update
sudo apt-get install ruby1.9.1-full
sudo apt-get install nodejs
sudo apt-get install npm
sudo apt-get install ruby
sudo apt-get install rbenv
{% endhighlight %}

<span class="label label-info">Update</span> Lewati dua proses ini bila anda berencana menggunakan Jekyll murni untuk ngeblog seperti di [Menyiapkan Jekyll untuk ngeblog](http://prana.la/2015/01/04/cara-instalasi-jekyll-untuk-blog/) karena kita akan menggunakan `kramdown` sebagai parser Markdown sebagai pengganti `Redcloth`

Pastikan instalasi gem RedCloth 4.2.9 sukses

{% highlight Bash %}
sudo gem install RedCloth -v '4.2.9'
{% endhighlight %}

setelah langkah-langkah tambahan diatas baru lakukan proses instalasi menurut
dokumentasinya. Oh ya instalasi bundler membutuhkan sudo, jangan lupa.

{% highlight Bash %}
sudo gem install bundler
{% endhighlight %}

selanjutnya ikuti dokumentasi.
