---
layout: post
title: NooElec R820T2 RTL-SDR USB dongle review
date: 2015-03-25 07:26:10 +0700 
comments: true
categories: [review, rtl-sdr]
sitemap:
  lastmod: 
  changefreq: weekly
  priority: 0.7
---
Nooelec is a big name in RTL-SDR products, back to Q4 2014 Nooelec is known as the first company who start selling RTL-SDR dongles with the R820T2 tuner chip built-in. The R820T2 is a small upgrade over the R820T as With retail price range around 24-27 USD from [Amazon.com: NooElec NESDR Mini 2 USB RTL-SDR & ADS-B Receiver Set, RTL2832U & R820T2 Tuner, MCX Input. Low-Cost Software Defined Radio Compatible with Many SDR Software Packages. R820T2 Tuner & ESD-Safe Antenna Input, Guaranteed: Electronics](http://prn.la/1zzmvvl) or Ebay so we may expect more on the build quality and performance. I purchase this dongle around December 2014 1 month after officialy released, with some expectation if I can get the early version of this dongle maybe I can get good build quality (with extra bugs, maybe). 

Sales package content as pictured, stock antenna is telescopic antenna that can retractable up to 31 cm max. During test I found no significant receive improvement whilst using this stock antenna. I tried to compare with short antenna that included in generic R820T RTL-SDR dongle using same dongle seems like the result is almost the same.   

Performance wise, as expected there are slight performance up in signal sensitivity especialy on 1090 Mhz ADS-B Band using stock antenna and APRS signal decoding using [Linux gqrx application](http://prana.la/2015/02/09/blunder-gqrx-di-ubuntu-trusty/)


Let's take a look at inside parts of [NooElec - NooElec NESDR Mini 2 SDR & DVB-T USB Stick (RTL2832 + R820T2) w/ Antenna and Remote Control - SDR Receivers - Software Defined Radio](http://prn.la/1zdQBaJ). You can easily disassembly it without any tools, just use your finger nail nothing is broken except your dongle warranty will void. 

Head to head with generic dongle, above picture is generic made in China dongle and below is the NooElec NESDR Mini 2 SDR & DVB-T USB Stick, can you spot the diference? : 

<img src="http://prana.la/images/nooelec-1.jpg" alt="nooelec compare with generic dongle" class="img-responsive center-block" />

Both PCBs are exactly the same! The only difference is NooElec NESDR Mini 2 SDR & DVB-T USB Stick for sure using RTL820T2 instead of RTL820T. Nooelec also relesed TCXO version of this dongle, according to their Ebay listing picture here [Nooelec Nesdr Mini 2 Rtl SDR DVB T USB Set w 0 5ppm TCXO R820T2 Tuner IC](http://prn.la/1FbRgN1), it seems the  PCB has "nooelec" marking. 

My recomendation is if you decide to buy Nooelec R820T2 dongle, go for their TCXO version, don't spend more money just for Nooelec brand if you can get same product cheaper.
  
