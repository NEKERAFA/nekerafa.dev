post_utils = require "utils.post"

for post in *@posts
    write post_utils.get_post { title: post.title, path: post.path, date: post.date, tags: post.tags, description: post.description, summary: true }
    write '<hr />'