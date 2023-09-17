lfs = require 'lfs'
sitegen = require 'sitegen'
tools = require 'sitegen.tools'

sass = tools.system_command "sass --style=compressed %s %s", "css"

date_regex = '(%d%d%d%d)%-(%d%d)%-(%d%d)'
name_regex = '[%w_]+'
post_regex = "#{date_regex}%-(#{name_regex}).md"

sitegen.create =>
    @title = 'nekerafa.dev'
    @author = 'Rafa Alcalde Azpiazu'
    @url = 'https://nekerafa.dev'
    @description = 'Blog personal de Rafa Alcalde Azpiazu'
    @meta_description = 'Blog personal de Rafa Alcalde Azpiazu'
    @twitter = '@nekerafa_dev'
    @lang = 'es'

    build sass, "styles.sass", "styles.css"

    add 'pages/home.html', target: 'index'
    add 'pages/404.md', target: '404'
    add 'pages/about.md', target: 'about'
    add 'pages/legal.md', target: 'legal'

    posts = {}
    for item in lfs.dir 'pages/posts'
        if item != '.' and item != '..'
            year, month, day, name = item\match "^#{post_regex}$"
            path = "pages/posts/#{item}"
            table.insert posts, { date: (os.time { :year, :month, :day }), :path, :name }

    table.sort posts, (a, b) -> a.date > b.date

    for _, post in ipairs(posts)
        add post.path, target: "posts/#{post.name}"

    blog_feed {}
