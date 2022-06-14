post_utils = require "utils.post"

for post in *@posts
    write post_utils.get_title post.title, post.path
    write post_utils.get_date post.date
    write post_utils.get_tags post.tags
    write post_utils.get_content post.description, post.path, true
    write '<hr />'