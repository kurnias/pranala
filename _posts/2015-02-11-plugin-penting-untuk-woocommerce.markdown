---
layout: post
title: "Plugin Penting untuk Woocommerce"
date: 2015-02-11 14:44:08 +0700
comments: true
categories: [woocommerce]
keywords: woocommerce, plugins, wordpress
description: Plugin penting dan esensial untuk toko online Woocommerce 
---
Ingin membuat online store WordPress dengan Woocommerce plugin, berikut plugin-plugin rekomendasi saya seperti yang saya gunakan di online store http://depoelektro.com
 
### <s>All In One SEO Pack</s> WordPress SEO by Yoast
Plugin ini penting tidak hanya untuk Woocommerce online store saja, tapi untuk semua situs blog berbasis WordPress. Meskipun WordPress sendiri sudah memiliki SEO yang cukup baik plugins All In One SEO Pack tetaplah satu plugin esensial yang wajib disematkan untuk meningkatkan SEO Woocommerce. <s>All In One SEO Pack</s> [WordPress SEO by Yoast Plugins](http://prn.la/1OS76jt) sendiri memilik fitur XML sitemaps yang mendukung *custom post type* sehingga kita dapat secara spesifik hanya mencantumkan *products* dalam sitemap.

Dibanding All In One SEO Pack, WordPress SEO by Yoast sepertinya lebih Google index friendly, terbukti dari jumlah URL yang berhasil disubmit dan sukses di-index Google. Oleh karenanya saya memutuskan untuk mengganti All In One SEO Pack!

Plugin Google XML sitemaps entah mengapa bermasalah dengan Woocommerce dengan adanya satu error yang sampai saat ini masih menjadi misteri yang belum bisa saya pecahkan.
Google Webmaster tools selalu menampilkan galat :

{% highlight sh %}
Issue: Missing XML tag. This required tag is missing. Please add it and resubmit
{% endhighlight %}

dan rupanya hal ini pernah dibahas di [diskusi](https://wordpress.org/support/topic/missing-xml-tag-error-on-google-webmaster-tools) tanpa simpulan yang jelas.

### WangGuard User Registration Spam Prevention

User registration spam adalah masalah umum yang sering ditemukan di forum, online store dsb. Ini sangat menganggu dan beresiko terhadap kemanan situs anda. [WangGuard Plugins](http://prn.la/1EWPmLK) adalah cara jitu untuk mengatasi nya. Langkah pertama sebelum menginstal plugin nya, anda harus terlebih dahulu melakukan registrasi di [WangGuard](http://prn.la/1EWPuL9) untuk mendapatkan API key.

### WooCommerce Product Archive Customiser
Plugin penting untuk mengatur tataletak produk jualan di front store dengan mudah dan fleksibel. Plugin ini saya gunakan untuk menentukan jumlah produk dalam satu baris yang ditampilkan serta jumlah produk per halaman. Tidak hanya itu plugin ini dapat menampilkan pula *stock levels* dsb. Penting karena untuk sebuah toko komponen yang menjual pernik kecil dengan variasi item yang teramat banyak, amat tidak efisien manakala kita hanya bisa menampilkan produk dalam jumlah kecil per laman.

### WooCommerce JNE Shipping ( Full Version )
Plugin lokal favorit saya, WooCommerce JNE Shipping adalah plugin yang memungkinkan kita menambahkan ongkos kirim berdasarkan alamat kirim dan paket kurir yang diambil secara otomatis. Kita tidak perlu repot-repot lagi menghitung manual, lalu mengkonfirmasikan nya pada pembeli agar menambahkan ongkos kirim nya pada pembayaran order nya.Plugin ini tersedia untuk JNE, TIKI dan Pos Indonesia.  Untuk JNE ada versi limited (trial) nya juga. Plugin dapat diperoleh di [http://www.agenwebsite.com/](http://www.agenwebsite.com/)

### WooCommerce Indonesian Bank Payment Gateways
Plugin opensource karya Fikri Rasyid yang dapat diunduh di [Github]({{ 'https://github.com/fikrirasyid/woocommerce-indonesian-bank-payment-gateways' | bitly }}) mendukung untuk 3 bank besar di Indonesia, BCA, Mandiri dan BNI. Menampilkan ke rekening bank mana customer dapat melakukan pembayaran. Plugin ini sayangnya tidak melakukan tracking apakah transfer pembayaran sudah diterima atau belum. <span class="label label-info">Update</span> Saat tulisan ini kami buat, plugin ini nampaknya bermasalah dengan Woocommerce 2.3.x 

### WooCommerce PDF Invoices & Packing Slips
Agar toko online akan nampak profesional kita bisa menyertakan invoice notes setiap order pelanggan. Plugin ini membantu sekali untuk mencetak invoice dan pavking slip dengan tampilan yang profesional. Sayang sekali plugin ini tidak menyertakan fitur print shipment address label. Tapi dengan sedikit modifikasi di template standar, kita dapat merubah packing slip menjadi shipping label. Unduh [WooCommerce Print Invoice & Delivery Note](https://wordpress.org/plugins/woocommerce-pdf-invoices-packing-slips/) 


### WP Admin No Show
Plugin ini mencegah user yang terdaftar sebagai Customer di sistem anda untuk mangakses backend `/wp-admin/` sangat berguna untuk meningkatkan keamanan toko online anda. 
