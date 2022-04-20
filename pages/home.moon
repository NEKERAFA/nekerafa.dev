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

        for line in string.gmatch post.description, '[^\n]+'
            table.insert content, p line

        table.insert content, hr

    content