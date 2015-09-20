---
layout: post
title: Little bit of Rakefile eye candy
date: 2015-04-25 13:43:20 +0700 
comments: true
categories: [bugfix]
sitemap:
  lastmod: 
  changefreq: weekly
  priority: 0.7
---
In this commit adding [Font Awesome, the iconic font and CSS toolkit](http://prn.la/1DqToL1) support for better and faster icon loading. And also put some colors on Rakefile build task status using `class String` methods to avoid aditional gem dependency.

{% highlight ruby %}
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
{% endhighlight %}

and usage:

{% highlight ruby %}
puts "I'm back green".bg_green
puts "I'm red and back cyan".red.bg_cyan
puts "I'm bold and green and backround red".bold.green.bg_red
{% endhighlight %}

Source : [colors - Colorized Ruby output - Stack Overflow](http://prn.la/1KeTE5K)

