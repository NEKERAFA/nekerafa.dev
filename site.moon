sitegen = require 'sitegen'
lfs = require 'lfs'
date = require 'date'

import extract_header from require 'sitegen.header'

sitegen.create =>
    @title = 'Rafael Alcalde Azpiazu'
    @url = 'https://nekerafa.dev'
    @description = 'Blog personal de Rafael Alcalde Azpiazu'
    @posts = {}

    for item in lfs.dir 'pages/posts'
        if item != '.' and item != '..'
            name = string.match item, '^(.+)%.moon$'
            path = "pages/posts/#{item}"
            add path, target: "posts/#{name}"

            fd = io.open path, 'r+'
            site = fd\read '*a'
            _, header = extract_header site
            header.path = "posts/#{name}.html"
            table.insert @posts, header

    post_cmp = (post_a, post_b) ->
        post_a.id > post_b.id

    table.sort @posts, post_cmp

    add 'pages/home.moon', target: 'index'
    add 'pages/404.md', target: '404'
    add 'pages/about.md', target: 'about'
    add 'pages/legal.md', template: 'legal', target: 'legal'

    blog_feed {}, "feeds/example.xml"
