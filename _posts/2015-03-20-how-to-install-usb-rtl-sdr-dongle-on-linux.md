---
layout: post
title: How to install USB RTL-SDR dongle on Linux
date: 2015-03-20 04:20:56 +0700 
comments: true
categories: [rtl-sdr,linux,ham radio]
sitemap:
  lastmod: 
  changefreq: weekly
  priority: 0.7
---

If you see an error that saying `Kernel driver is active, or device is claimed by second instance of librtlsdr`, don't panic. This error occur since the new Ubuntu kernel has already contains a DVB driver that also claiming same RTL-SDR device. To fix this error simply detach the kernel driver before running RTL-SDR apps such as gqrx, sdrsharp, dump1090 etc.

There are two ways to detach the kernel driver, first you can detach using this command
{% highlight bash %}
sudo modprobe -r dvb_usb_rtl28xxu
{% endhighlight %}
or if you want to make it permanent nexttime you reboot your machine, you can do blacklist to kernel DVB driver
{% highlight bash %}
cd /etc/modprobe.d/
sudo nano rtlsdr.conf
{% endhighlight %}

add the following line:
{% highlight bash %}
blacklist dvb_usb_rtl28xxu
{% endhighlight %}

The file name `rtlsdr.conf` above is not mandatory, as long as it ended with `.conf` extension then it's okay. The second way (I'm using this way on my 14.04 Ubuntu) is

{% highlight bash %}
sudo update
sudo apt-get install libusb-1.0-0-dev cmake
git clone git://git.osmocom.org/rtl-sdr.git
mkdir ~/rtl-sdr/build
cd ~/rtl-sdr/build
cmake ../ -DINSTALL_UDEV_RULES=ON -DDETACH_KERNEL_DRIVER=ON
make
sudo make install
sudo ldconfig
{% endhighlight %}

Make sure you have git installed before. Next insert your dongle and run `lsusb` command search for your string that shows your RTL-SDR dongle id, for generic hama nano dongle it should be like this:
{% highlight bash %}
SUBSYSTEM=="usb", ATTRS{idVendor}=="0bda", ATTRS{idProduct}=="2838", GROUP="adm", MODE="0666", SYMLINK+="rtl_sdr"
{% endhighlight %}
You need to adjust  `ATTRS(idvendor)` and `ATTRS(idProduct)` value if they are different with yours. If you are using hama nano generic then you are lucky, just copy paste above text to:
{% highlight bash %}
sudo nano /etc/udev/rules.d/20.rtlsdr.rules
{% endhighlight %}
almost done, last step is restart `udev`
{% highlight bash %}
sudo service udev restart
{% endhighlight %}

That's all now your dongle is ready!
