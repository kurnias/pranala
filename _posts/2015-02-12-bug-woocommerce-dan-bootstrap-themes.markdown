---
layout: post
title: "Bug woocommerce dan bootstrap themes"
date: 2015-02-12 06:15:21 +0700
comments: true
categories: [woocommerce, bugfix]
keywords: 
description: Woocommerce checkout shipping option radiobutton overlap dengan text 
---
Bosan dengan tampilan toko online yang lama, saya coba utk ganti theme yang lebih bootstrap-ish dengan Dazzling theme dari Colorlib. Masalahnya pada saat check-out, saya mendapati sedikit bug dimana text shipping option tumpang tindih dengan radio button nya. Perkiraan awal bug ini timbul dari plugin shipping yang saya pergunakan yang tidak kompatibel dengan theme-nya. Tak kunjung mendapat balasan dari developernya, coba-coba cari tahu inti masalahnya ada dimana.

<img src="http://prana.la/images/overlapped-radio-button-text.png" alt="woocommerce bug" class="img-responsive center-block" />

Saat menggunakan themes lain yang zonder bootstrap semuanya normal-normal saja, dan saat menggunakan shipping option yang lain di theme yang mengandung unsur bootstrap masalah yg sama tetap muncul juga. Jadi masalah bukan disisi pluginnya, tapi semata-mata kompatibilitas woocommerce dengan theme yang menggunakan bootstrap framework. Developer Dazzling themes nya sendiri menganjurkan tweak seperti ini, 
{% highlight css %}

#shipping_method label {
    font-weight: 400;
}
.woocommerce .cart-collaterals .cart_totals, .woocommerce-page .cart-collaterals .cart_totals {
    width: 60%;
}
#shipping_method {
    text-align: left;
} 
{% endhighlight %}


Tapi tweak diatas tidak memecahkan masalah, justru dengan menambahkan baris berikut sebagai custom-style CSS di theme option Dazzling, ternyata masalah terselesaikan.

{% highlight css %}
.woocommerce #shipping_method label {
display: inline;
}
{% endhighlight %}

Case closed.
