---
layout: post
title: "Blunder gqrx di Ubuntu Trusty"
date: 2015-02-09 12:29:07 +0700
comments: true
categories: [ham radio, rtl-sdr, linux] 
keywords: gqrx, rtl-sdr, ubuntu, error
description: 
---

Meski [gqrx.de]({{ 'http://gqrx.de' | bitly }}) mewartakan versi 2.3 sudah keluar cukup lama, tapi ternyata ini tidak menjadi kabar yang baik buat saya yang selama ini menggunakan versi stable yang tersedia resmi di repository standar Ubuntu. Alih alih mencoba upgrade versi malah membawa saya ke blunder broken packages yang menggagalkan proses instalasinya. Payahnya, saat mencoba balik lagi ke versi gqrx lama. Si Synaptic package manager ngomel terus ngingatin adanya broken packages yang masih nggantung yang ditandai dengan pesan galat seperti ini:

{% highlight sh %}
E: Error, pkgProblemResolver::Resolve generated breaks, this may be caused by held packages.
{% endhighlight %}

Dan instalasi tidak dapat dilanjutkan. Downgrade gak bisa, upgrade gak bisa. Solusi nya ternyata sangat mudah, cukup hapus saja repository `PPA:gqrx/releases` yang terbukti menyesatkan dengan perintah:

{% highlight sh %}
sudo add-apt-repository --remove ppa:gqrx/releases
{% endhighlight %}

Lalu lanjutkan instalasi gqrx versi 2.2. Ternyata benar adanya pepatah yang mengatakan newer not always better.

<span class="label label-success">Update!</span> cara ini ternyata lebih ampuh, untuk menginstal 2.3.2 dengan baik dan benar. [Installing gnuradio on Ubuntu 14.04 with the packaging manager · mossmann/hackrf Wiki](http://prn.la/1zwRCaH)

By far this is the easiest way to install
{% highlight sh %}
sudo add-apt-repository ppa:gqrx/releases
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install gqrx gnuradio gr-osmosdr hackrf
{% endhighlight %}

For other options see: http://www.pg540.org/wiki/index.php/HackRF

If you run into installing troubles (for example a 'Held packages' type message), possibly because of existing packages previously installed, do a

{% highlight c %}
sudo apt-get dist-upgrade
{% endhighlight %}

