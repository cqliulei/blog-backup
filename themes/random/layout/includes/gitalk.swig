<!--引入 Gitment -->
<div id="gitalk-container"></div>
<link  rel="stylesheet" href="{{theme.gitalkstyle || config.gitalkstyle}}">
<script src="{{theme.gitalkscript || config.gitalkscript}}"> </script>
<script type="text/javascript">
    var gitalk = new Gitalk({
      clientID: 'd63e22e42890f5cc3a5b',
      clientSecret: '90cabbe06b89b26a21540c54cd5837d87961e65b',
      repo: 'cqliulei.github.io',
      owner: 'cqliulei',
      admin: 'cqliulei',
      id: location.pathname,      // Ensure uniqueness and length less than 50
      distractionFreeMode: false  // Facebook-like distraction free mode
    })
    gitalk.render('gitalk-container');
</script>
<!-- 引入 Gitalk end -->