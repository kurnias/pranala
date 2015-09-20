---
layout: post
title: "Octopress: Cara rsync Lewat SSH Tanpa Password"
date: 2015-02-02 23:01:01 +0700
comments: true
categories: [octopress,linux]
keywords: octopress, passwordless, ssh, rsync
description: Cara benar dan termudah untuk melakukan login SSH tanpa password
---
Salah satu metoda deploymen blog berbasis Octopress atau Jekyll adalah dengan menggunakan rsync lewat SSH. Langkah pertama dan utama adalah memastikan proses login lewat SSH tanpa password sudah kita setting dengan benar sehingga saat melakukan `rake deploy` atau `rake gen_deploy` kita tidak direpotkan untuk memasukkan password secara manual.

###Step 1: Membuat pasangan public key dan private key di localhost
Dari jendela terminal `localhost` ketik perintah:
{% highlight sh %}
ssh-keygen
{% endhighlight %}
cukup tekan enter setiap kali ditanya sesuatu.

###Step 2: Mengunggah kunci public ke remote-host
{% highlight sh %}
cat .ssh/id_rsa.pub | ssh user@remote_host "cat >> ~/.ssh/authorized_keys"
{% endhighlight %}
gantilah `user@remote_host` dengan dusername dan alamat remote host anda sesungguhnya. Saat anda menjalankan perintah diatas, anda akan diminta untuk memasukkan password `remote_host`. Tujuannya adalah untuk menambahkan `id_rsa.pub` anda dalam file `~/.ssh/authorized_keys`. Selesai, mudah sekali bukan?

###Step 3: Menguji SSH dan menyesuaikan parameter Rakefile di Octopress
Ujilah dengan menggunakan perintah:
{% highlight sh %}
ssh username@remote_host
{% endhighlight %}
dengan menjalankan perintah diatas anda akan langsung masuk ke remote host tanpa menggunakan password, jika terjadi masalah seperti anda masih tetap harus memasukkan password meskipun sudah mengikuti langkah setting diatas gunakan switch `-v` (verbose mode) untuk melihat error yang terjadi.

Bila masalah seperti diatas terjadi, periksa kembali dan pastikan folder `.ssh/` memiliki permission 700 dan file `authorized_keys` permission 600. 

Langkah berikutnya adalah mengedit `Rakefile` Octopress seperti dokumentasi:

{% highlight ruby %}
ssh_user       = "user@domain.com"
document_root  = "~/website.com/"
rsync_delete   = true
deploy_default = "rsync"
{% endhighlight %}
 

