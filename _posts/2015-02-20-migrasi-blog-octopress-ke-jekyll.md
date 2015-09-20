---
layout: post
title: Migrasi blog dari Octopress ke Jekyll
date: 2015-02-20 21:27:59 +0700 
comments: true
category: jekyll 
sitemap:
  lastmod: 
  changefreq: weekly
  priority: 0.7
---

Octopress yang awalnya menggelitik saya dengan konsepnya untuk membuat situs blog statis  tanpa menggunakan server side scripting dan database seperti Wordpress. Dengan tagline nya "A blogging framework for hackers"  saya mambayangkan keren-nya membuat blog seperti layaknya seorang hacker melakukan coding dengan bermodal text editor dan serangkaian perintah untuk mengkompilasi source code menjadi lewat command line interface.

<img src="http://prana.la/images/jekyll.png" alt="jekyll" class="img-responsive center-block" />

Nyatanya setelah mencoba [Octopress 2.0 Surface](http://octopress.com) beberapa waktu, Octopress yang seharusnya menjadi wrapper bagi [Jekyll](http://jekyllrb.com) yang harusnya berfungsi menyederhanakan Jekyll (yang semula saya kira rumit)  malah justru membuat rumit dan sulit bagi saya untuk memahami bagaimana satu bagian terkait dengan bagian lain.

Kalo toh Octopress menggunakan Jekyll juga, kenapa nggak langung pakai Jekyll saja dengan demikian saya dapat menghilangkan keruwetan Octopress, hal ini lah yang menyemangati saya untuk memulai proyek belajaran ini.  

Objektif nya jelas, menulis ulang blog ini dengan genartor blog-statis Jekyll

- KISS Keep It Simple and Slim tanpa mengandung unsur code yang gemuk dan susah dimengerti dengan segudang fitur-fitur yg mubazir.
- Menggunakan Jekyll murni, Liquid tag dan Twitter Bootstrap
- Meminimalisir penggunaan plugin Jekyll untuk hal-hal yang benar-benar perlu saja.
- Markup language menggunakan [Markdown](http://daringfireball.net/projects/markdown) 
- SEO Optimized

Github repository for this project is [kyllstrap](https://github.com/kurnias/kyllstrap)  
