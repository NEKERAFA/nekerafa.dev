{
    id: 3
    title: "Unha nova instancia"
    date: "17 may 2022"
    is_a: "blog_post"
    tags: { "post", "opinión", "galego" }
    description: [[Boas a todes!!
Esta vai ser unha entrada bastante cortiña. Veño anunciaros que, co motivo das letras galegas, acabo de engadir meu propio gran de area creando unha nova instancia para mastodon: [mastodon.gal](https://mastodon.gal).
As inscripcións están abertas a todo o público (procurarei que ser bastante firme coas contas que se creen estos días).
Os espero ver a todes alí, ata máis ver!!]]
}

post = require "utils.post"

write post.get_title @title
write post.get_date @date
write post.get_tags @tags
write post.get_content @description