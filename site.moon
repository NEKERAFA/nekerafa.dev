sitegen = require 'sitegen'

sitegen.create =>
    @title = 'nekerafa.dev'
    @footer = [[The content on this web is licensed under <a ref="external" href="https://creativecommons.org/licenses/by/4.0" target="_blank">Creative Commons Attribution 4.0 (CC BY 4.0) <i class="fa-brands fa-creative-commons"></i><i class="fa-brands fa-creative-commons-by"></i></a>.

See more information on <a ref="license" href="/legal.html">legal</a> page.

Generated with <a ref="external" href="http://leafo.net/sitegen" target="_blank">Sitegen</a>.]]

    add 'pages/home.md', target: 'index'
    add 'pages/404.md', target: '404'
    add 'pages/about.md', target: 'about'
    add 'pages/legal.md', template: 'legal', target: 'legal'

    add 'pages/posts/hola_mundo.md', template: 'post', target: 'posts/hola_mundo'