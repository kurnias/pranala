# A Liquid tag that gives embedding Facebook's "Embedded Posts" functionality into Jekyll sites.
# By - Zac Clancy (@zac_c)
# 
# Source url: https://github.com/zclancy/octopress_facebook_embedded_posts_plugin
# Blog post: http://blackglasses.me/2013/08/30/facebook-embedded-posts-and-octopress/
# Facebook embedded post info: https://developers.facebook.com/blog/post/2013/07/31/introducing-embedded-posts/
# 
# Syntax: {% facebook_embedded_post url %}
# Example: {% facebook_embedded_post https://www.facebook.com/FacebookDevelopers/posts/10151471074398553 %}
module Jekyll
  class FacebookEmbeddedPost < Liquid::Tag
    def initialize(tag_name, url, tokens)
      super
      @post_url = url
    end

    def render(context)
      if @post_url
        html_output_for @post_url
      else
        "Error processing input, expected syntax: {% facebook_embedded_post post_url %}"	
      end
    end

    def html_output_for(post_url)
<<HTML
<div id='fb-root'></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = '//connect.facebook.net/en_US/all.js#xfbml=1';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<div class='fb-post' data-href='#{post_url}'></div>
HTML
    end
  end
end

Liquid::Template.register_tag('facebook_embedded_post', Jekyll::FacebookEmbeddedPost)			
