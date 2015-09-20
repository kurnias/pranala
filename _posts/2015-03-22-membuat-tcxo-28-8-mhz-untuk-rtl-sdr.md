---
layout: post
title: Membuat TCXO 28.8 MHz untuk RTL-SDR
date: 2015-03-22 08:44:58 +0700 
comments: true
categories: [rtl-sdr]
sitemap:
  lastmod: 
  changefreq: weekly
  priority: 0.7
---

Terinspirasi dari proyek [海谷の凧: R820T SDRチュナー 外部発振器28.8MHz(TXCO14.4MHz×2)の製作](http://prn.la/1MVkj9i) kali ini saya mencoba untuk membuat external 28.8 Mhz oscilator untuk elcheapo RTL-SDR dongle. Sayang nya komponen-komponen utama  yang diperlukan untuk proyek diatas 100% tidak ada di Jakarta.

Karena TCXO 28.8 Mhz teramat langka dan susah diperoleh di pasaran, strateginya sederhana yaitu dengan menggunakan TCXO 14.4 Mhz yang masih relatif mudah ditemukan dan output nya dikalikan 2  dengan IC PLL clock multiplier dalam proyek ini saya gunakan ICS511MI sebagai ganti ICS512MLF. Komponen utama yang digunakan adalah:
  
- TCXO 14.4 Mhz [Meiden CO-T67PZ](http://prn.la/1Lnfubs) 
- IC PLL clock multiplier [ICS511MI](http://prn.la/1Foc5Wm) 
- 74VHCU04SJX Hex Inverter (opsional), 

ICS511MI IC PLL clock multiplier kecil buatan IDT adalah komponen yang menarik. Faktor multiplier diatur melalui pin S0 S1. Seperti tabel, untuk mengalikan 2X frekuensi input S0 dan S1 cukup dibuat NC saja.

<img src="http://prana.la/images/ICS511.png" alt="ICS511MI" class="img-responsive center-block" /> 

Hampir semuanya import dan harus dibeli dalam jumlah yang relatif banyak, membuat proyek ini cukup berat di kantong, kedepan mungkin akan saya kemas dalam bentuk kit barangkali ada yang membutuhkan. 
