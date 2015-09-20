---
layout: post
title: RTL-SDR direct sampling mode
date: 2015-04-19 13:04:53 +0700 
comments: true
categories: [rtl-sdr]
sitemap:
  lastmod: 
  changefreq: weekly
  priority: 0.7
---

Direct sampling (DS) singkat kata adalah metoda dimana kita melakukan injek signal RF langsung dari antenna menuju ke IC DVB-T COFDM Demodulator [Realtek RTL2832U](http://www.realtek.com.tw/products/productsView.aspx?Langid=1&PFid=35&Level=4&Conn=3&ProdID=257) dengan melakukan bypass chip tuner R820T. Direct sampling dapat dilakukan dengan 2 cara, yaitu I branch DS dimana signal RF masuk dari pin 1 dan 2 dan Q branch DS dimana signal masuk melalui pin 4 dan 5 RTL2832U.

Keuntungan menggunakan direct sampling ini adalah metoda ini memungkinkan dongle bekerja di rentang frekuensi HF dibawah 24 Mhz yang merupakan batas terbawah frekuensi yang mampu ditala oleh tuner R820T tanpa menggunakan upconverter meskipun performanya masih dibawah jika anda menggunakan upconverter. Mengingat harga upconverter yang relatif mahal bahkan lebih mahal dari harga donglenya sendiri, solusi ini tentunya menarik untuk dicoba.

#### 1.Modifikasi dongle untuk Direct Sampling 

Modifikasi dongle USB RTL-SDR yang sering anda jumpai di pasaran membutuhkan ketelitian dan ketrampilan menyolder yang tinggi, terutama jika anda ingin menggunakan Q branch DS. Karena anda diharuskan untuk menyolder kawat jumper berukuran 0.5 mm langsung ke kaki IC RTL2832U. 

Modifikasi akan lebih mudah jika anda menggunakan I branch DS, karena anda cukup melepas C33 dan C34 dan menyolderkan kawat jumper/email bekas tapaknya yang menuju pin 1 dan 2 RTL2832U

<img src="http://prana.la/images/ds-mods-rtlsdr-small.jpg" alt="Q branch mods" class="img-responsive center-block" />

dengan cukup menambahkan kabel sekitar sejengkal sebagai antenna, kita sudah bisa menangkap siaran broadcast radio AM di frekuensi kerja 758 Khz. Experimen kedepan mungkin kita akan mencoba melihat pengaruh impedansi matching di jalur input RF terhadap performa metoda direct sampling.

#### 2.Dongle yang Direct Sampling ready 

Pilihan lainnya adalah dengan menggunakan dongle khusus yang telah mendukung modus direct sampling seperti [Newsky RTL2832U R820T2 Rtl SDR SMA BNC Coax DAB FM MCX Socket Special Dongle](http://prn.la/1IrH6Xy) yang dapat anda beli di Ebay dengan harga sekitar 14 USD + shipping. Dongle yang menggunakan tuner R820T2 ini memiliki fitur menarik yaitu adanya tapak khusus di PCB yang memudahkan anda dalam menyolder sambungan ke antenna tanpa susah payah menyoldernya langsung ke kaki IC RTL2832U. Review lebih lanjut tentang dongle ini dapat anda baca di artikel berikut di blog saya [Newsky RTL2832U R820T2 USB dongle review](http://prana.la/2015/04/15/newsky-rtl2832u-r820t2-usb-dongle-review/)

<img src="http://prana.la/images/newsky-3.jpg" alt="Newsky" class="img-responsive center-block" />


