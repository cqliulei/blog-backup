{% include 'includes/head.swig' %}
<style>
    * {
        /*border: thin red solid;*/
    }

    header .bg-header {
        height: 560px;
        background-color: #62A4FF;
    }

    /*头像*/
    .bg-header .avatar img {
        border-radius: 50%;
        margin-top: 100px;
        max-width: 170px;
    }

    .bg-header h1,
    .bg-header h2 {
        color: white;
    }

    /*姓名*/
    .bg-header h1 {
        letter-spacing: 2px;
        text-shadow: 0 0 10px rgba(15, 15, 15, .3);
    }

    /*描述*/
    .bg-header h2 {
        font-size: 18px;
        margin-top: 12px;
    }

    /*整个作品展示区*/
    section .works-area {
        margin-top: -150px;
    }

    .works-area .works-item {
        border-radius: 2px;
        border: 1px solid #eee8d5;
        margin-bottom: 50px;
        box-shadow: 8px 5px 10px rgba(0, 0, 0, .2);
    }

    .works-item-img {
        margin: auto -26px;
    }

    .works-item-img img {
        width: 100%;
    }

    .works-area .works-item {
        background: white;
        padding: 5px 25px;
    }

    .works-area .footer {
        padding-top: 10px;
        border-top: thin #eee solid;
    }

    .works-area .footer .btn {
        padding: 7px 9px;
        border-radius: 2px;
        float: right;
        margin: 8px 0;
        text-transform: none;
        font-size: 12px;
        font-style: italic;
        background: #0085a1;
        border: none;
        color: #fff;
    }

    .works-item .works-content {
        padding-top: 15px;
    }

    .works-item .title {
        padding-top: 6px;
    }

    .works-item .title h3 {
        display: inline-block;
        margin: 0 15px 0 0;
        height: 33px;
        font-size: 18px;
        font-weight: 400;
    }

    .works-item .title .title-date {
        float: right;
        font-size: 18px;
    }

    .works-item .use span {
        display: inline-block;
        font-size: 12px;
        border-radius: 3px;
        padding: 0 4px;
        border: thin solid #795548;
    }

    .works-item .subtitle {
        margin: 0;
        font-size: 17px;
    }

    .footer-box{
        color: #888;
        text-align: center;
        padding: 10px;
        padding-top: 30px;
        background-color: #fff;
        font-size: 14px;
    }

    @media screen and (max-width: 400px) {
        .works-item .footer .use {
            font-size: 14px;
        }

        .works-item .works-item-img {
            height: 200px;
        }

        .bg-header .avatar img {
            max-width: 150px;
        }

        .bg-header h1 {
            font-size: 24px;
        }

        section .works-area {
            margin-top: -210px;
        }
    }
</style>
{% include 'includes/nav.swig' %}
<div class="works-container" style="background-color: #fafafa">
    <header>
        <div class="bg-header text-center">
            <div class="profile">
                <div class="avatar">
                    <img src="{{ config.avatar || theme.avatar }}">
                </div>
                <div class="personal-profile">
                    <h1>
                        {{ config.title }}
                    </h1>
                    <h2>{{ config.subtitle }}</h2>
                   
                     
                </div>
            </div>
        </div>
    </header>
     <div class="container">
        <section class="row">
            <div class="col-sm-10 col-sm-offset-1 col-md-8 col-md-offset-2 works-area">
                {% set works = config.myworks || theme.myworks %}
                  {% if works  %}                    
                    {% for x in works %}
                      <div class="works-item">
                         <div class="title">
                             <h3>
                                 {{ x.title }}
                             </h3>
                             <span class="title-date text-muted">
                                 {{ x.date }}
                             </span>
                         </div>
                        {% if x.src %} 
                         <div class="works-item-img">
                             <img src="{{ x.src }}">
                         </div>
                         {% endif %}
                         <div class="works-content">
                             <div class="use text-warning"> 
                              {% for y in x.tags %}                               
                                 <span>
                                     {{ y }}
                                </span> 
                              {% endfor %}                                
                             </div>
                             　
                             <p class="subtitle"> {{ x.subtitle }} </p>
                     
                             <p class="text-muted"> {{x.text}} </p>
                         </div>
                         <div class="footer clearfix">
                             <a class=" btn btn-default" href="{{ x.href }}" target="_blank"> Open it</a>
                         </div>
                      </div>             
                  {% endfor %}
                {% endif %}


            </div>
        </section>
    </div>
</div>
{% if page.comments && (theme.duoshuo_shortname || config.duoshuo_shortname) %}
  {% include 'duoshuo.swig' %}
{% endif %}
{% if page.comments && (config.disqus_shortname || theme.disqus_shortname) %}
  {% include 'disqus.swig' %}
{% endif %}
{% if page.comments && (config.uyan_id || theme.uyan_id) %}
  {% include 'uyan.swig' %}
{% endif %}

{% include 'includes/footer2.swig' %}