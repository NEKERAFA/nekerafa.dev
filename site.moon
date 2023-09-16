lfs = require 'lfs'
sitegen = require 'sitegen'
tools = require 'sitegen.tools'

sass = tools.system_command "sass %s %s", "css"

date_regex = '%d%d%d%d%-%d%d%-%d%d'
name_regex = '[%w_]'
post_regex = "^#{date_regex}%-(#{name_regex}+).md$"

sitegen.create =>
    @title = 'nekerafa.dev'
    @author = 'Rafa Alcalde Azpiazu'
    @url = 'https://nekerafa.dev'
    @description = 'Blog personal de Rafa Alcalde Azpiazu'
    @twitter = "@nekerafa_dev"
    @lang = "es"

    build sass, "styles.sass", "styles.css"

    for item in lfs.dir 'pages/posts'
        if item != '.' and item != '..'
            name = item\match post_regex
            path = "pages/posts/#{item}"
            add path, target: "posts/#{name}"

    add 'pages/home.html', target: 'index'
    add 'pages/404.md', target: '404'
    add 'pages/about.md', target: 'about'
    add 'pages/legal.md', target: 'legal'

    blog_feed {}
