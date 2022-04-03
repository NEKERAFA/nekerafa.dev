sitegen = require 'sitegen'

sitegen.create =>
    @title = 'NEKERAFA\'s blog'

    add 'pages/home.md', target: 'index'
    add 'pages/404.md', target: '404'
    add 'pages/about.md', target: 'about'
    add 'pages/legal.md', template: 'legal', target: 'legal'

    add 'pages/posts/hola_mundo.md', target: 'posts/hola_mundo'