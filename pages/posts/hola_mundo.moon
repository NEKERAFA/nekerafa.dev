{
    id: 1
    title: "¡Hola mundo!"
    date: "2 april 2022"
    is_a: "blog_post"
    tags: { "post" }
    description: [[¡Buenas a todes! 😼
Como veis, me he creado una web personal. En este espacio pondré cosillas que me irán surgiendo a lo largo de la vida (bueno, creo que todos entendemos el concepto de blog a estas alturas).
Además, también usaré esta web para subir tutoriales míos, como dev blog de mis proyectos personales, y hasta recetas de comida (por qué no, que me encanta cocinar).
Saludos y nos vemos pronto.]]
}

post = require "utils.post"

write post.get_title @title
write post.get_date @date
write post.get_tags @tags
write post.get_content @description