<!--引入 Gitalk -->
<div id="gitalk-container" class="git_comment"></div>
<link  rel="stylesheet" href="{{theme.gitalkstyle || config.gitalkstyle}}">
<script src="{{theme.gitalkscript || config.gitalkscript}}"> </script>
<script type="text/javascript">
    var gitalk = new Gitalk({
      clientID: 'f74c7456fc9be54b9f54',
      clientSecret: 'f8fb245fc0c9c76a0a11aa5cdc7353d9d803ea4a',
      repo: 'cqliulei.github.io',
      owner: 'cqliulei',
      admin: ['cqliulei'],
      id: location.pathname,      // Ensure uniqueness and length less than 50
      distractionFreeMode: true,  // Facebook-like distraction free mode
    })
    gitalk.render('gitalk-container');
</script>
<!-- 引入 Gitalk end -->