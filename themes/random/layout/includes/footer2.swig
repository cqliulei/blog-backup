<!-- Footer -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1 text-center footer-box">
                <p>©2019 cqliulei.com 版权所有 <span>蜀ICP备15017955号</span></p>          
                <p class="copyright text-muted">
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
                </p>

            </div>
        </div>
    </div>
</footer>

<script>
// is trigger analytics / tongji script
var isIgnoreHost = false;

if(window && window.location && window.location.host) {
  isIgnoreHost = {{ JSON.stringify(config.theme.ignoreHostList || theme.ignoreHostList) }}.some(function(address){
    return 0 === window.location.host.indexOf(address);
  });
}

var isTriggerAnalytics = !( {{ JSON.stringify(config.isIgnoreSpecialHostVisitor || theme.isIgnoreSpecialHostVisitor) }} && isIgnoreHost );

</script>
{% if config.baidu_analytics || theme.baidu_analytics || config.baidu_tongji || theme.baidu_tongji %}
  {% include 'baidu-tongji.swig' %}
{% endif %}
{% if config.google_analytics || theme.google_analytics %}
  {% include 'google-analytics.swig' %}
{% endif %}