---
layout: post
title: Launching Chrome from docky on Ubuntu
date: 2015-05-21 13:06:23 +0700 
comments: true
categories: [Linux]
sitemap:
  lastmod: 
  changefreq: weekly
  priority: 0.7
---

I have installed google-chrome-stable by using `google-chrome-stable_current_amd64.deb` on my ubuntu 14.04. I am able to start the browser by typing google-chrome-stable in my terminal or from double clicking Chrome icon at `/usr/share/applications`. My strange issue is how do I launch chrome from docky? Well I'm able to add a link to Chrome in my taskbar and when I click on this launcher icon another (ugly low res) Chrome icon gets added to the docky launcher. This is a simple way how to make Chrome has only single icon on docky:

<!-- more -->
<ol>
<li> Open <code>/usr/share/applications/google-chrome.desktop</code> with sudo privileges in any editor.

</li>
<li> Open Chromium or Chrome browser depends on which one you install it does not matter, if it shows in a different icon or not.
</li>
<li>
Open a terminal window and type:   
   {% highlight sh %}
     xprop | grep WM_CLASS
   {% endhighlight %}
</li>
<li>
Move Your mouse pointer click anywhere inside the Chrome/ium window. Something like this will show up in the terminal:

   {% highlight sh %}
    WM_CLASS(STRING) = "Google-chrome-stable", "Google-chrome-stable"
   {% endhighlight %}
</li>
<li>
In the editor, in which you opened the *.desktop file, write on the second line (after the <code>[Desktop Entry]</code>):
 {% highlight sh %}
    StartupWMClass=Google-chrome-stable
 {% endhighlight %}
or <code>StartupWMClass=whatever-was-in-the-terminal-output</code> (in either of the quotes).
</li>

</ol>
Save the file and the result should be seen immediately.


