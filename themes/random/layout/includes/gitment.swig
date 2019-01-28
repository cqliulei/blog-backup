<!--引入 Gitment -->
<div id="gitment-container" class="git_comment"></div>
<link  rel="stylesheet" href="{{theme.gitmentstyle || config.gitmentstyle}}">
<script src="{{theme.gitmentscript || config.gitmentscript}}"> </script>
<script type="text/javascript">
   /* var myTheme = {
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
    }*/
    var gitment = new Gitment({
      id: location.href, // 可选。默认为 location.href
      owner: 'cqliulei',
      repo: 'blog_Gitalk',
      oauth: {
        client_id: 'f74c7456fc9be54b9f54',
        client_secret: 'f8fb245fc0c9c76a0a11aa5cdc7353d9d803ea4a',
      },
      //theme: myTheme
    })
    gitment.render('gitment-container')
</script>
<!-- 引入 Gitment end -->