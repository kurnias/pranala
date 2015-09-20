---
layout: post
title: Cara install Android ADB di Linux
date: 2015-05-01 10:58:37 +0700 
comments: true
categories: [linux]
sitemap:
  lastmod: 
  changefreq: weekly
  priority: 0.7
---
Sebagaimana di platform OS lain, menginstal Android ADB dan fastboot di Linux sebenarnya adalah hal yang sangat mudah. Pastikan repositori-nya sudah terdaftar di package management yang anda gunakan. Untuk Ubuntu 14.04 yang saya lakukan adalah sebagai berikut:

{% highlight sh %}
sudo add-apt-repository ppa:phablet-team/tools
sudo apt-get update
{% endhighlight %} 

Setelah repository sukses ditambahkan, jalankan perintah berikut.

{% highlight sh %}
sudo apt-get install android-tools-adb android-tools-fastboot
{% endhighlight %} 

Hubungkan Android anda dengan kabel USB dalam modus USB storage dan aktifkan USB debuging di menu setting developer option lalu coba jalankan perintah berikut:

{% highlight sh %}
sudo adb kill-server
sudo adb start-server
sudo adb devices
{% endhighlight %}

Ingat jalankan `adb` dengan perintah `sudo` supaya device anda terdeteksi seperti ini:

{% highlight sh %} 
List of devices attached 
0123456789ABCDEF	device
{% endhighlight %}

