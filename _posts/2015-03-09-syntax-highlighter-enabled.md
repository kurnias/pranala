---
layout: post
title: Syntax highlighter enabled
date: 2015-03-09 07:14:25 +0700 
comments: true
categories: [jekyll, bugfix]
sitemap:
  lastmod: 
  changefreq: weekly
  priority: 0.7
---

Default [Pygments](http://pygments.org/) syntax highlighter did not work due to missing `.css/syntax.css` fixed. Adding CSS from [https://gist.github.com/demisx/025698a7b5e314a7a4b5](https://gist.github.com/demisx/025698a7b5e314a7a4b5) instead from mojombo original `syntax.css` highlighter. 

Modify `default.html` template with:
{% highlight html %}
<!-- Syntax highlighter -->
     <link href="/css/syntax.css" rel="stylesheet">
{% endhighlight %}

Kyllstrap Github commit ID 4c0c210 syntax highlighter working.

