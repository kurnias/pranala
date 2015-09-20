---
layout: post
title: Meiden CO-T67PZ 14.4Mhz TCXO
date: 2015-03-17 05:42:03 +0700 
comments: true
categories: [ham radio]
sitemap:
  lastmod: 
  changefreq: weekly
  priority: 0.7
---
Despite of low technical information and datasheet regarding this TCXO module, Meiden CO-T67PZ 14.4MHz TCXO DIP operating with voltage from DC +3.3v to +5v generates an approximate 400 mVp-p clipped sine wave output signal @+5V and has max 2.5ppm and typically 1ppm frequency stability from -30 to +70 degrees C. Measured phase noise for this TCXO is -140dBC/Hz @ 10Khz offset. 

<img src="http://prana.la/images/tcxo-co-t67pz.png" alt="tcxo-co-t67pz pin out" class="img-responsive center-block" /> 

Just like swiss army knife TCXO, interesting fact about 14.4Mhz frequency since it will divide evenly into the following ham radio frequencies for use as a marker on 144MHz, 432, 1296, 2304, 3456, 5670. 10.368GHz and 24.192GHz for use as a marker. 14.4MHz will also divide evenly into all the low-side injection frequencies for bands 1296 and up when using either 144MHz or 432MHz for the IF frequency. (1296-144=1152) divided by 14.4 = 80 etc.  

<img src="http://prana.la/images/meiden-tcxo.jpg" alt="meiden tcxo" class="img-responsive center-block" />

This means you can multiply 14.4MHz up to generate your LO for all the microwave bands. I will use this TCXO for my upcoming project related to [In search of stable 28.80000 Mhz](http://prn.la/1x68klQ) as key component to generate stable 28.8Mhz to improving RTL-SDR dongle stability solution for bad frequency drift issue due to low-quality reference crystal used on many generic RTL-SDR dongle.

Another interesting mods for this TCXO can be found at: [Converting 14.4 MHz TCXO's for voltage tuning operation](http://prn.la/1O0YHK9) and more interesting reading on oscillator [Oscillator Technology](http://prn.la/1O10AGJ)


