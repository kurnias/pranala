---
layout: post
title: "Membuat Collinear Antenna untuk ADS-B"
date: 2015-02-05 19:21:41 +0700
comments: true
categories: [rtl-sdr,ham radio]
keywords: rtl-sdr, antenna, ads-b, collinear, homebrew
description: Membuat sendiri antenna collinear untuk ADS-B 1090 Mhz.
---

Berhubung antenna bawaan RTL-SDR dongle terbukti jelek, disini saya akan mencoba membikin sendiri antenna outdoor dalam bentuk antenna collinear untuk ADS-B dengan frekuensi kerja di 1090 Mhz.

Bahan yang digunakan cukup sederhana:

1. Kabel coax (RG59, 75 ohm biasa untuk kabel antenna TV, saya menggunakan Belden RG6 9916S bekas kabel Indovision dengan VC (velocity vactor) 0.83. 
2. Selotip untuk isolator
3. PVC untuk selongsong antenna.

Disini kita akan membuat antenna collinear sederhana untuk 1/2 lambda. Rumus Perhitungan panjang per-section (300/1090) * 0.5 * 0.83 =  11.4 cm. Tambahkan sekitar 3 cm di setiap ujungnya sehingga panjang persection total menjadi sekitar 17.4 cm. Kupas tiap ujungnya sepanjang 3 cm, seperti pada gambar berikut:

<img src="http://prana.la/images/belden.jpg" alt="belden" class="img-responsive center-block" />
 
Setelah itu susun, section demi section dengan menyelipkan inner ke braid section pasangan nya seperti pada gambar berikut.

<img src="http://prana.la/images/CollinearAntenna.gif" alt="colinear" class="img-responsive center-block" />

Seperti pada gambar diatas sebagai terminasi di ujung section teratas, beri resistor kecil sesuai impedansi kabel yang digunakan. Hal ini untuk menjaga agar nilai VSWR mendekati 1. 

Jumlah section coax collinear dianjurkan cukup sekitar 4-6 element, terlalu banyak jumlah section akan mengakibatkan pola radiasi menjadi terlalu datar yang malah menyebabkan sensitifitas antena menjadi berkurang.

Sumber [Coaxial Collinear Antenna for ADS-B](http://prn.la/19a5CQp)
