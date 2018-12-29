<!--引入 Gitment -->
<div id="gitment-container"></div>
<link  rel="stylesheet" href="{{theme.gitmentstyle || config.gitmentstyle}}">
<script src="{{theme.gitmentscript || config.gitmentscript}}"> </script>
<script type="text/javascript">
    var myTheme = {
      render(state, instance) {
        var container = document.createElement('div')
        container.lang = "en-US"
        container.className = 'gitment-container gitment-root-container'
        container.appendChild(instance.renderHeader(state, instance))
        container.appendChild(instance.renderEditor(state, instance))
        container.appendChild(instance.renderComments(state, instance))
        container.appendChild(instance.renderFooter(state, instance))
        return container
      },
    }
    var gitment = new Gitment({
      id: location.href, // 可选。默认为 location.href
      owner: 'cqliulei',
      repo: 'blog_Gitment',
      oauth: {
        client_id: 'd63e22e42890f5cc3a5b',
        client_secret: '90cabbe06b89b26a21540c54cd5837d87961e65b',
      },
      theme: myTheme
    })
    gitment.render('gitment-container')
</script>
<!-- 引入 Gitment end -->