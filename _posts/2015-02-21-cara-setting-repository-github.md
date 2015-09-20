---
layout: post
title: Cara setting repository Github
date: 2015-02-21 11:06:54 +0700 
comments: true
categories: github
sitemap:
  lastmod: 
  changefreq: weekly
  priority: 0.7
---

#### 1. Buat repository baru
Login ke [Github](https://github.com) dan buatlah repository baru misanya dalam contoh ini adalah NEW-REPO

#### 2. Clone
Lakukan clone dengan menalankan perintah berikut dari terminal, pastikan `git` sudah terinstall sebelumnya {% highlight sh %}
git clone https://github.com/USERNAME/NEW-REPO.git LOCAL-DIR
cd LOCAL-DIR
git remote set-url origin git@github.com:USERNAME/NEW-REPO.git
git push origin master
{% endhighlight %} `LOCAL-DIR` tidak usah digunakan apabila ingin cloning ke directory dengan nama yang sama dengan nama repository Github.

#### 3. Test push
{% highlight sh %}
git add -A
git commit -m "test commit"
git push origin master
{% endhighlight %}



