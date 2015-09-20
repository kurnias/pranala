---
layout: post
title: Using VPN Gate with OpenVPN on Ubuntu 14.04
date: 2015-04-28 09:01:20 +0700 
comments: true
categories: [linux]
sitemap:
  lastmod: 
  changefreq: weekly
  priority: 0.7
---

[VPN Gate - Public Free VPN Cloud by Univ of Tsukuba, Japan](http://prn.la/1J5Lhsc) is a great free VPN service. But it seems lack support and how to's documentation on how to use this VPN service with [OpenVPN](https://openvpn.net/) on Linux platform. After a bit tweaking around finally I can connect my Ubuntu desktop through VPN here is how to do it, first get these packages installed:

{% highlight sh %}
sudo apt-get update
sudo apt-get install libpkcs11-helper1 easy-rsa resolvconf openvpn
{% endhighlight %}

You may get some `packages already installed` notification it's okay, make sure you met all dependencies required.

Now get OpenVPN config (*.ovpn) file from VPN Gate site, put it somewhere inside your home directory then try run this command:

{% highlight sh %}
sudo openvpn --config your-openvpn-config.ovpn
{% endhighlight %}

If you got DNS resolv issue, refresh your web browser cache, or relaunch your browser. If DNS problem still persist, check your `/etc/resolv.conf` file and make sure you have `nameserver` entry that pointing to the VPN service DNS, if the entry is not found then we have to put it. Remember you can not edit the `/etc/resolv.conf` and put the entry directly, since the file is auto-generated and will be overwritten time to time by Ubuntu network manager application.

What you need to do is add following lines to the bottom of your `.ovpn` configuration file:

{% highlight sh %}
up /etc/openvpn/update-resolv-conf
down /etc/openvpn/update-resolv-conf
{% endhighlight %}

Then reinvoke openvpn client, now with additional parameter `--script-security 2` to allow user script above being executed:

{% highlight sh %}
openvpn --script-security 2 --config your-openvpn-config.ovpn
{% endhighlight %}

Check again your `/etc/resolv.conf` check for new `nameserver` entry that should be our VPN service DNS, your problem should be solved.

<span class="label label-success"><i class="fa fa-info-circle"></i> Notes:</span> By far I'm  still having difficulties to setup VPN connection using Ubuntu network manager applet the simptoms as described here [network manager - Configure VPN... is greyed out and I cannot edit my VPN settings - Ask Ubuntu](http://prn.la/1JwPbxO), Ubuntu network manager VPN config can not parse .ovpn file. It requires you to extract certificate section into three files they are `ca.crt` `client.crt` `client.key` before you can save VPN setting. 





