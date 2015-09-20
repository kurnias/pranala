---
layout: post
title: "mini-howto APRX iGate TP-Link MR-3420"
date: 2015-01-05 16:25:09 +0700
comments: true
categories: [aprx,ham radio,openwrt]

description: "mini how to instal APRX daemon on OpenWrt Attitude Adjustment for APRS iGate"
keywords: "aprx openwrt mr-3420 tplink"
---

mini-howto instalasi APRX iGate TP-Link MR-3420 v1.7

<div class="alert alert-info alert-dismissible">
<p>
    <span class="glyphicon glyphicon-info-sign"></span>
    <strong>Perhatian:</strong> anda memerlukan callsign amatir radio untuk bereksperimen dengan APRS
</p>
</div> 

###Instal OpenWrt 
Distro yg dipakai OpenWrt Attitude Adjustment 12.09, cukup ramping dengan kernel Linux 3.X. Default instal menyisakan sekitar 780KB ruang di flash memory - cukup lega untuk menginstal paket aplikasi APRX berikut utilitas dan driver untuk USB to serial adapter. Lebih  mengenai instalasi OpenWrt di `TP-Link MR-3420` dapat dilihat di [wiki OpenWRT TP-Link TL-MR3420]({{ 'http://wiki.openwrt.org/toh/tp-link/tl-mr3420' | bitly }}).

###Instal package driver USB to Serial dan APRX

{% highlight Bash %}
root@OpenWrt:~#opkg update
root@OpenWrt:~#opkg install usbutils
{% endhighlight %}

Pasang USB to serial adapter ke USB port router, lalu reboot router.

Cek type chipset USB to serial adapter dengan perintah:
{% highlight Bash %}
root@OpenWrt:~# cat /proc/bus/usb/devices 
{% endhighlight %}

<img src="http://prana.la/images/serial-to-usb-controller-check.png" alt="serial-to-usb-controller-check" class="img-responsive center-block" />
Sesuaikan driver dengan type chipset, dlm contoh diatas Silabs CP2102 kernel 
module yang sesuai adalah `kmod-usb-serial-cp210x`

{% highlight Bash %}
root@OpenWrt:~#opkg install kmod-usb-serial-cp210x
{% endhighlight %}

Reboot lagi biar mantep, cek dengan perintah `dmesg` apabila semua OK, akan ada baris bertuliskan seperti:
{% highlight Bash %}
usb 1-1: cp210x converter now attached to ttyUSB0
{% endhighlight %}
selamat! port `ttyUSB0` anda telah aktif.

berikutnya install aprx daemon,
{% highlight Bash %}
root@OpenWrt:~#opkg update
root@OpenWrt:~#opkg install aprx
{% endhighlight %}

###Konfigurasi /etc/aprx.conf
Panduan instalasi lengkap aprx dapat dilihat di http://ham.zmailer.org/oh2mqk/aprx/aprx-manual.pdf.
 
For simple case, you need to adjust 4 things:

* Mycall/CALLSIGN parameter
* Select correct type of interface (ax25-device or serial-device)
* Optionally set a beacon telling where this system is
* Optionally enable digipeater with or without tx-igate

Koneksi ke radio dibahas di kesempatan lain, yg penting tebar beacon biar eksis dulu di http://aprs.fi.

###Setting Autorun daemon APRX di OpenWrt

Bila perlu sesuaikan nilai `START=99` di script `/etc/init.d/aprx` nilai ini menentukan diurutan mana daemon APRX akan dijalankan saat boot.
Untuk membuat APRX agar auto execute saat boot jalankan perintah:

{% highlight Bash %}
root@OpenWrt:/# /etc/init.d/aprx enable
{% endhighlight %}

cek di `/etc/rc.d/` apakah symlink `99aprx` sudah terbentuk.

