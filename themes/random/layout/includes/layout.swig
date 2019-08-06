{% include 'head.swig' %}
<body>
{% include 'side-pagination.swig' %}
<div id="outer-container" class="hide-area">
<div id="container">
  <div id="menu-outer" class="slide-down">
    <div id="menu-inner">
      <div id="brand">
        {# <a href="{{ url_for('/') }}"> #}
        <a onClick="openUserCard()">
          <img id="avatar" src="{{theme.logoavatar}}"/>
          <div id="homelink">{{config.title}}</div>
        </a>
      </div>
      <div id="menu-list">
        <ul>
        {% set menu = config.menu || theme.menu %}
        {% for key in Object.keys(menu) %}
          {% if is_current(menu[key]) %}
            <li class="active">
          {% else %}
            <li>
          {% endif %}
            <a href="{{ url_for(menu[key]) }}">{{ key }}</a>
            {# <span>{{key}}</span> #}
          </li>
        {% endfor %}
        </ul>
      </div>
      <div id="show-menu">
        <button>Menu</button>
      </div>
    </div>
  </div>

  <div id="content-outer">
    <div id="content-inner">
      {# {% autoescape false %}{{ body }}{% endautoescape %} #}
      {% block body %}{% endblock %}
      {% if page.comments && (theme.duoshuo_shortname || config.duoshuo_shortname) %}
      <div class="ds-thread" data-thread-key="{{ page.path }}" data-title="{{ page.title }}" data-url="{{ page.permalink }}"></div>
      {% endif %}
      {% if page.comments && (config.uyan_id || theme.uyan_id) %}
      <div id="uyan_frame"></div>
      {% endif %}
      {% if page.comments && (config.disqus_shortname || theme.disqus_shortname) %}
      <div id="disqus_thread"></div>
      {% endif %}
    </div>
  </div>

  <!-- gitment评论-->
  {% if page.comments && (theme.gitment_shortname || config.gitment_shortname) %}
    {% include 'gitment.swig' %}
  {% endif %}

    <!-- gitalk评论-->
    {% if page.comments && (theme.gitalk_shortname || config.gitalk_shortname) %}
      {% include 'gitalk.swig' %}
    {% endif %}

  <div id="bottom-outer">
    
    <div id="bottom-inner">

      <!--<p>关于我们 | 官方博客 | 商务合作 | 友情链接 | 加入我们 | 帮助</p>-->
      <p>©2019 cqliulei.com 版权所有 <span>蜀ICP备15017955号</span></p>
    
      Site by {{ config.author }} using
      <a href="http://hexo.io">Hexo</a>
      <br>
      {% if config.since %}
        &copy;
        {% set thisYear = date(Date.now(), 'YYYY') %}

        {{config.since}}
        {% if thisYear != config.since %}
         - {{ date(Date.now(), 'YYYY') }}
        {% endif %}
      {% endif %}
    </div>
  </div>
 
</div>
</div>




{% if page.comments && (config.disqus_shortname || theme.disqus_shortname) %}
  {% include 'disqus.swig' %}
{% endif %}
{% if page.comments && (config.uyan_id || theme.uyan_id) %}
  {% include 'uyan.swig' %}
{% endif %}
{% include 'footer.swig' %}
