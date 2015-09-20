---
layout: post
title: Setup Google Cloud Print with Ubuntu
date: 2015-05-06 05:50:30 +0700 
comments: true
categories: [linux]
sitemap:
  lastmod: 
  changefreq: weekly
  priority: 0.7
---
Ensure that yo have cloud print setup with your Google account for details check [this](http://www.google.com/cloudprint/learn/howitworks.html). Run this command to add the repository CUPS Google Cloud Print.

{% highlight sh %}
sudo add-apt-repository ppa:simon-cadman/niftyrepo
sudo apt-get update
sudo apt-get install cupscloudprint
sudo /usr/share/cloudprint-cups/setupcloudprint.py
{% endhighlight %}

Name the account for this cloud print service, use your Gmail.
{% highlight sh %}
Name for this user account ( eg something@gmail.com )? youremail@gmail.com
{% endhighlight %}

then you will be asked to open given link to authorize CUPS to manage your printer, make sure you logged into your google account where you want to setup the cloud print.

{% highlight sh %}
Open this URL, grant access to CUPS Cloud Print,then provide the code displayed : 

https://accounts.google.com/o/oauth2/auth?scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fcloudprint&redirect_uri=urn%3Aietf%3Awg%3Aoauth%3A2.0%3Aoob&response_type=code&....
{% endhighlight %}

Copy back code from Google to your terminal windows and the next step should be self-explanatory

{% highlight sh %}
Code from Google: 4/2eGis_MtpRJjBeWskb4p2H3REOScB0lr-yB-......

You currently have these accounts configured: 
youremail@gmail.com
Add more accounts (Y/N)? N
Add all Google Cloud Print printers from youremail@gmail.com to CUPS (Y/N)? Y
Use a prefix for names of created printers (Y/N)? Y  
Prefix ( e.g. GCP- )? GCP-
Added GCP-Canon-PIXMA-MP230
Added GCP-Save_to_Google_Drive
Added 2 new printers to CUPS
{% endhighlight %}


How do I remove google accounts from CUPS Cloud Print? The `deleteaccount.py` script will remove accounts from CUPS Cloud Print:

{% highlight sh %}
sudo /usr/share/cloudprint-cups/deleteaccount.py
{% endhighlight %}

Google has added new options for my printer, but CUPS is not showing them as options, how to I force CUPS Cloud Print to refresh the printer capabilities?

Running the upgrade script refreshes the available printer options:

{% highlight sh %}
sudo /usr/share/cloudprint-cups/upgrade.py
{% endhighlight %}

