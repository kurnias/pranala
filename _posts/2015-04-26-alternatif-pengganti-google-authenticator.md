---
layout: post
title: Alternatif pengganti Google Authenticator
date: 2015-04-26 08:12:12 +0700 
comments: true
categories: [linux, review]
sitemap:
  lastmod: 
  changefreq: weekly
  priority: 0.7
---
Setelah pusing dengan smartphone [AccessGO bermasalah dengan Google Authenticator](http://prn.la/1DlV74n), saya coba cari alternatif pengganti software untuk generator token 2FA itu, ternyata banyak sekali! Kemudian saya coba pilah-pilah hanya pada aplikasi yang dibuat oleh perusahaan yang cukup dikenal dan terpercaya, dan berikut review saya.

<!-- more -->

#### Authy
[Authy 2-Factor Authentication](http://prn.la/1DlUTu0) banyak yang menjagokan Authy sebagai aplikasi multi factor authentication terbaik karena fitur tambahan diluar fitur standar aplikasi 2FA seperti cloud backup, multi devices synchronization, PIN dan juga tampilan UI nya yang meriah dan fancy. Saya justru melihat fitur-fitur diatas sebagai suatu kemewahan yang tidak perlu, unnecessary luxuries ([The Pursuit of Happyness (2006) - IMDb](http://prn.la/1DlWxvq))

Pengalaman membuktikan pemakaian sehari-hari tidak membutuhkan fitur-fitur fancy seperti itu. Disisi lain banyak fitur malah menambah keruwetan bahkan membuka celah keamanan yang tidak perlu, sebut saja fitur Cloud disaat kita mencegah pihak ketiga mengetahui informasi token kita, kenapa malah kita harus share ke cloud?

Aplikasi ini membutuhkan ruang sekitar 14 MB di Android anda, cukup besar untuk sebuah aplikasi 2FA token generator. 

#### Microsoft Authenticator
Seperti namanya aplikasi ini dibuat Microsoft, saat setting kita diharuskan memiliki Microsoft account. Detail lengkap bagaimana menggunakan Microsoft Authenticator ada di [Are You Looking for a Google Authenticator App on Windows Phone?](http://prn.la/1JFJJoY). Aplikasi ini membutuhkan ruang sekitar 9.57 MB di Android anda, masih cukup besar untuk sebuah aplikasi 2FA token generator. 

#### FreeOTP
[FreeOTP Authenticator](http://prn.la/1DlVQ5A) adalah aplikasi opensource Red Hat Inc. Tersedia untuk Android dan iOS, source code FreeOTP lengkap dapat diunduh di [sini](http://prn.la/1DqWkaB). Ringkas dan ringan karena hanya membutuhkan ruang 2.57 MB di Android anda jauh lebih kecil dibanding sang de facto standard Google Authenticator yang membutuhkan ruang 3.87 MB. FreeOTP tidak membutuhkan setting yang rumit dan  mudah digunakan dan tanpa fitur berlebih. FreeOTP mendukung 2FA di Google, Facebook, Evernote, GitHub dan banyak lagi. Berbeda dengan Google Authenticator, begitu dibuka aplikasi ini tidak segera menampilkan 2FA token akun-akun online anda. Anda harus tap disalah satu online account yang ingin anda dapatkan token nya, tap sekali lagi untuk mengcopynya di clipboard. Fitur copy to clipboard ini bermanfaat sekali bila anda membuka situs yang membutuhkan 2FA di Android, sehingga tidak perlu mengingat-ingat token untuk dimasukkan manual saat diminta.

FreeOTP tidak memiliki opsi untuk melakukan sinkronisasi waktu secara otomatis ataupun manual

Pilih yang mana? Berangkat sebagai pemakai [Google Authenticator](http://prn.la/1DlWSyh) dalam kurun waktu yang cukup lama sejak  [Google meluncurkan 2FA](http://prn.la/1DlXp3t) awal tahun 2011, saya melihat Google Authenticator sebenarnya sudah sangat bagus. Sedikit pengembangan di sisi user interface bagi saya sudahlah lebih dari cukup. Dari dua solusi diatas, saya lebih memilih FreeOTP.   


