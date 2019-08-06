{% include 'includes/head.swig' %}
<div class="random-center hide-area">
  <div id="random-index">
    <div class="center-field">
      <img class="avatar" src="{{ config.avatar || theme.avatar }}" width=120 height=120>
    </div>
    <div class="center-field">
      <div class="title">{{ config.title }}</div>
      <div class="sub-title">{{ config.subtitle }}</div>
    </div>
    <hr >
    <div class="center-field">
      <ul class="index-nav-link">
        {% set menu = config.menu || theme.menu %}
        {% for key in Object.keys(menu)  %}
          {% if menu[key] != '/'  %}
            <li><a href="{{ url_for(menu[key]) }}">{{ key }}</a></li>
          {% endif %}
        {% endfor %}
      </ul>
      {% include 'includes/social-icon.swig' %}
    </div>
  </div>
</div>
<div class="dha-footer">
  <p>©2019 cqliulei.com 版权所有 <span>蜀ICP备15017955号</span></p>
</div>
{% include 'includes/footer.swig' %}


