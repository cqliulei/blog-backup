<!DOCTYPE html>
<html lang="en">

<!-- Head tag -->
{% include 'head.swig' %}
<style>

    header.intro-header {
        background-image: url('{{ config.header-img }}')
    }
</style>
<!-- hack iOS CSS :active style -->
<body ontouchstart="" class="animated fadeIn">
{% include 'nav.swig' %}
<!-- Main Content -->
<%- body %>
<!-- Footer -->
<!-- <%- partial('_partial/footer') %> -->
<!--wechat title img-->
<img class="wechat-title-img" src="{{  config.sidebar-avatar }}">
</body>

</html>