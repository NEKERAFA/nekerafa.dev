sitegen = require 'sitegen'

sitegen.create =>
    @title = 'nekerafa.dev'

    add 'pages/home.md', target: 'index'
    add 'pages/404.md', target: '404'
    add 'pages/legal.md', template: 'legal', target: 'legal'