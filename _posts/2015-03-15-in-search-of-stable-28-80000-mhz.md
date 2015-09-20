---
layout: post
title: In search of stable 28.80000 Mhz
date: 2015-03-15 07:56:24 +0700 
comments: true
categories: [rtl-sdr, ham radio]
sitemap:
  lastmod: 
  changefreq: weekly
  priority: 0.7
---
The 28.8 MHz crystal oscillator used on the RTL-SDR USB dongle is known for being low quality that cause a bad impact on stability of tuned frequency that lead to frequency  drift due to heat exposed during long time dongle operation. 

Feeding with the R820T or even R820T2 with highly stable 28.8000 Mhz will significantly improve the performance of your RTL-SDR dongle. You can buy TCXOs' modified RTL-SDR dongles on [Ebay](http://www.ebay.com/itm/SDR-Realtek-RTL2832U-R820T-with-HIGH-STABILITY-TCXO/171689027497) for 69 USD, I use this price as max budget to find the cheapest solution to get high quality 28.80000 Mhz signal.

#### 1. Use good-quality 28.800 Mhz Crystal 
Replace with good quality Japan manufactured 28.8000 Mhz crystal can give you stability under ±10ppm comparing to more than 50ppm with the original crystal. [表面実装型水晶振動子 28.8MHz 常温／温特／±10PPM以下品 USBチューナー搭載方法](http://prn.la/1BO8cpE). My problem is I can not purchase directly from [Amazon Japan](http://www.amazon.co.jp/s/ref=bl_sr_electronics?ie=UTF8&field-keywords=SHAFT%E3%80%80CORPORATION&node=3210981) and the buying agent fee is quite expensive. Purchasing 5 sets crystals cost me arround 61 USD!


#### 2. Use 28.800 Mhz TCXO 
The dream solution is takuji's [28.8MHz TCXO換装キット配布のご案内](http://blog.goo.ne.jp/osqzss/c/a2ee4231ddbe2e470c84473367146256). After write him an email asking some information regarding the TCXO kits unfortunately he's no longer providing it and has no more plan to replenish his stock again and suggest me to check [R820T with 28.8 MHz TCXO](http://michelebavaro.blogspot.com/2014/03/r820t-with-288-mhz-tcxo.html) at Michele's GNSS blog.

From Michelle's blog I got TCXO spec 28.80MHz GTXO-92T/GS SM TCXO
TCXO, no VC, ±1.5ppm, -30+75°C.

#### 3. Multiply 14.400 Mhz TCXO 
This is a promising solution, if you don't care with the form factor. The idea is to multiply 14.4000 Mhz TCXO such as [Meiden CO-T67PZ 14.4Mhz TCXO](http://prn.la/1Lnfubs) which easier and cheaper to obtain. 

There are various way to double the frequency, First as described in [28.8 MHz TCXO Option for USB SDRs (mirror)](http://prn.la/1Cnuh06) using SBL-1 mixer.  

Recently I found interesting and simpler way using [IC512M LOCO PLL Clock Multiplier](http://www.idt.com/products/clocks-timing/clock-generators-frequency-synthesizers-pll-and-differential-clocks/pll-clock-generators-frequency-multipliers-and-phase-locked-loops/512-loco-pll-clock-multiplier?cid=778336) as described here [R820T SDRチュナー 外部発振器28.8MHz(TXCO14.4MHz×2)の製作](http://kaiyanotako.blogspot.com/2014/02/r820t-sdr-288mhztxco144mhz2.html). 

To be continued ...
 
