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

    str_conv = '(%d+) (%l+) (%d+)$'
    month_conv = { january: 1, february: 2, march: 3, april: 4, may: 5, june: 6, july: 7, august: 8, september: 9, october: 10, november: 11, december: 12 }

    get_timestamp = (date) ->
        day, month, year = string.match date, str_conv
        os.time {month: month_conv[month], :day, :year}

    date_cmp = (post_a, post_b) ->
        date_a = get_timestamp post_a.date
        date_b = get_timestamp post_b.date
        os.difftime date_a, date_b

    table.sort @posts, date_cmp

    add 'pages/home.moon', target: 'index'
    add 'pages/404.md', target: '404'
    add 'pages/about.md', target: 'about'
    add 'pages/legal.md', template: 'legal', target: 'legal'

    blog_feed {}, "feeds/example.xml"
