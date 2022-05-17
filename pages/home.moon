html ->
    content = {}

    for post in *@posts
        table.insert content, h1 a { href: post.path, post.title }
        table.insert content, h2 {
            i { class: 'fa-solid fa-calendar-day' },
            post.date
        }

        tags = [span { class: 'badge rounded-pill tag', tag } for tag in *post.tags]
        table.insert content, p tags

        more_flag = false
        for line in string.gmatch post.description, '[^\n]+'
            continue if more_flag
            if line == '<!--more-->'
                more_flag = true
                table.insert content, p a { href: post.path, 'Show more...' }
            else
                table.insert content, p line

        table.insert content, hr

    content