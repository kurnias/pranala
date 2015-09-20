---
layout: post
title: Change to post header title
date: 2015-03-16 05:28:52 +0700 
comments: true
categories: [bugfix,jekyll]
sitemap:
  lastmod: 
  changefreq: weekly
  priority: 0.7
---
Change the header title in `includes\header.html` from:
{% highlight html %}
{% raw %}
    <title>{{ site.name }} &middot; {{site.subtitle}}</title>
{% endraw %}
{% endhighlight %}

Page title change to `post.title` not `site.subtitle` when opening single post.

{% highlight html %}
{% raw %}
    {% if page.layout == 'post' %}
    <title>{{ site.name }} &middot; {{page.title}}</title>
	{% else %}
    <title>{{ site.name }} &middot; {{site.subtitle}}</title>
    {% endif %}
{% endraw %}
{% endhighlight %}

I use `page.layout` to evaluate YAML frontmatter for post specific layout, instead of `page.is_post` which strangely not working in my case. May be due to missing defaults section in my `_config.yml`

What I learn here is how jekyll if-else works. Git commit id for this bugfix is 89f7310

