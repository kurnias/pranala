---
layout: post
title: How can I revert back to a Git commit?
date: 2015-03-07 07:25:54 +0700 
comments: true
categories: github
sitemap:
  lastmod: 
  changefreq: weekly
  priority: 0.7
---

Simple, first find out which commit ID you wish to revert back with this easy command:
{% highlight Bash %}
git log --oneline
{% endhighlight %}

If you did many commits before it could be little bit a tedious task to do especially when your commits are not well commented. Therefor __it is important to give proper comment__ before every commit, this will help you a lot when doing revert back. Now, use the commit ID from the previous step and use this command to revert single file:
{% highlight Bash %}
git checkout [commit_id] [filename] 
{% endhighlight %}

or 

{% highlight Bash %}
git checkout [commit_id]
{% endhighlight %}

to revert all files in the repository. Hope this will help.
