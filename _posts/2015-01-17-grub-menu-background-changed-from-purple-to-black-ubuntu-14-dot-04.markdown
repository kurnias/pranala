---
layout: post
title: "Grub Menu Background Changed from Purple to Black Ubuntu 14.04"
date: 2015-01-17 21:52:31 +0700
comments: true
categories: [linux]

description: "Ubuntu 14.04 Grub default background color fix after update"
keywords: "Ubuntu Grub Linux"
---

A while ago, my Ubuntu 14.04 committing automatic software updates that require system starts,
after restart I found the Grub menu background is no longer Purple just a plain Black and White that could do that. my system works fine and there is no problems with anything. I just don't like looking at a black grub while waiting in the booting process. I love Purple, so this is simple tricks to fix it.
<!--more-->

From terminal window:

```
sudo nano /lib/plymouth/themes/default.grub
```

it will create new file `default.grub`. put these lines to return the purple color.

```
if background_color 44,0,30 ; then
    clear
fi
```

Once you have finished editing  save it and run

```
sudo update-grub
```

That's all. Restart and you should got the default purple color back.
