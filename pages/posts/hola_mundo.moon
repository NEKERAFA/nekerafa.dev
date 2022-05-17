{
    title: "¡Hola mundo!"
    date: "2 april 2022"
    is_a: "blog_post"
    tags: { "post" }
    description: [[¡Buenas a todes! 😼
Como veis, me he creado una web personal. En este espacio pondré cosillas que me irán surgiendo a lo largo de la vida (bueno, creo que todos entendemos el concepto de blog a estas alturas).
Además, también usaré esta web para subir tutoriales míos, como dev blog de mis proyectos personales, y hasta recetas de comida (por qué no, que me encanta cocinar).
Saludos y nos vemos pronto.]]
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