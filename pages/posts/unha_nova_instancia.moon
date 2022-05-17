{
    title: "Unha nova instancia"
    date: "17 may 2022"
    is_a: "blog_post"
    tags: { "post", "opinión" }
    description: [[Boas a todes!!
Esta vai ser unha entrada bastante cortiña. Veño anunciaros que, co motivo das letras galegas, acabo de engadir meu propio gran de area creando unha nova instancia para mastodon: https://mastodon.gal.
As inscripcións están abertas a todo o público (procurarei que ser bastante firme coas contas que se creen estos días).
Os espero ver a todes alí, ata máis ver!!]]
}

html ->
    tags = [ span { class: 'badge rounded-pill tag', tag } for tag in *@tags ]
    desc = {}
    for line in string.gmatch @description, '[^\n]+'
        continue if line == '<!--more-->'
        table.insert desc, p line

    {
        h1 "#{@title}"
        h2 {
            i { class: 'fa-solid fa-calendar-day' }
            "#{@date}"
        }
        p tags
        unpack desc
    }