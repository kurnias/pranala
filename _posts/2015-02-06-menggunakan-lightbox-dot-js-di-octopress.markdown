---
layout: post
title: "Menggunakan lightbox.js di Octopress"
date: 2015-02-06 16:23:42 +0700
comments: true
categories: [octopress]
keywords: lightbox, javascript, octopress, jekyll
description: Cara mudah menggunakan lightbox.js di Octopress
---

Bukan Octopress kalo gak semua harus kita lakukan dengan manual, termasuk image pop up yang seharusnya dilakukan dengan mudah, entah kenapa plugin yang seharusnya menjadi defacto standard Octopress plugin untuk image popup tidak berjalan di instalasi Octopress saya.

Nyerah dengan error `undefined safe_wrap method` yang saya temui di [imgpopup plugins milik wak Brian Clapper]({{ 'https://github.com/bmc/octopress-plugins' | bitly }}) dan turunannya seperti [Bootstrap modal-nya wak Ray Faddis]({{ 'https://github.com/rayfaddis/octopress-BootstrapModal' | bitly }}) error yang sama gejalanya seperti yang dibahas di [Blog-nya wak Vincent Tam]({{ 'http://vincenttam.github.io/blog/2014/08/13/install-ruby-again-2/' | bitly }}). Berangkat dari segala kesulitan itu saya mencoba untuk back to basic, mencoba solusi yang bersahabat untuk pemula Ruby dan Jekyll programming seperti saya.

Langkahnya sederhana. Mula-mula, unduhlah paket [Lightbox 2 nya mang Lokesh Dhakar]({{ 'http://lokeshdhakar.com/projects/lightbox2/' | bitly }}) letakkan di direktori `source\javascripts` dan folder `css` lightbox di folder `source\assets\lightbox` atau direktori lain sesuai selera. 

kemudian saya melakukan sedikit adaptasi atas jekyll plugins nya kyoendo-san. Karena Octopress menggunakan Jekyll untuk menghasilkan laman situs statis, plugin Jekyll dan Liquid tag nya pasti akan kompatibel.

{% highlight ruby%}
{% raw %}
# A Liquid tag for Jekyll sites that allows embedding Lightbox images.
# by: kurnias
# Source URL: https://gist.github.com/c4fc4f1fa2231a28f860
# Example usage: {% lightbox 2012/abc.png, Title of Image, Alt Title %}
module Jekyll
  class LightboxTag < Liquid::Tag
    def initialize(tag_name, text, token)
      super
      @text = text
    end
 
    def render(context)
      path, title, alt = @text.split(',').map(&:strip)
      %{<a href="/images/#{path}" rel="lightbox" title="#{title}"><img src="/images/#{path}" height="384" width="512" alt="#{alt || title}" /></a>}
    end
  end
end
 
Liquid::Template.register_tag('lightbox', Jekyll::LightboxTag)
{% endraw %}
{% endhighlight %}


Tambahkan di file `source\_includes\custom\head.html` baris berikut :

{% highlight html %}
<script src="{{ root_url }}/javascripts/libs/jquery/jquery-2.0.3.min.js"></script>
<script src="{{ root_url }}/javascripts/libs/lightbox/js/lightbox.min.js"></script>
<link href="{{ root_url }}/assets/lightbox/css/lightbox.css" rel="stylesheet" type="text/css">
{% endhighlight %}


Sesuaikan direktori tempat anda meletakkan hasil ekstraksi paket Lightbox nya. Cara menggunakan tag nya cukup mudah:

{% highlight html %}
{% raw %}
{% lightbox abc.png, Title of Image, Alt Title %}
{% endraw %}
{% endhighlight %}

Tag diatas akan menampilkan gambar thepicture.jpg yang masih hardcoded  di direktori  `source\images` Octopress anda. Pengembangan kedepan barangkali kita coba berkreasi dengan sizing, floating position dsb, langkahnya cukup mudah dengan memodifikasi plugins diatas.

Contoh penggunaan tag ini seperti di artikel : http://prana.la/2015/02/04/unboxing-nooelec-nesdr-mini-2-sdr-and-dvb-t-dongle/




