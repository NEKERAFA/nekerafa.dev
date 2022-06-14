discount = require "discount"

get_title = (title, path) ->
    if path
        return "\n#{discount "# [#{title}](#{path})"}"

    "\n<h1>#{title}</h1>"

get_date = (date) ->
    "<h2><span class='fa-solid fa-calendar-day'></span>#{date}</h2>"

get_tags = (tags) ->
    tag_data = "<p>\n"
    for tag in *tags
        tag_data ..= "<span class='badge rounded-pill tag'>#{tag}</span>\n"
    
    tag_data .. "</p>"

get_content = (description, path, summary=false) ->
    content = ""
    more_flag = false
    for line in string.gmatch description, '[^\n]+'
        continue if more_flag
        if summary and line == '<!-- more -->'
            more_flag = true
            content ..= discount "[Show more...](#{path})"
        else
            content ..= discount line
    
    content

{ :get_title, :get_date, :get_tags, :get_content }