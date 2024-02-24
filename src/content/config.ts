import { z, defineCollection } from 'astro:content';

const resumeCollection = defineCollection({ type: 'content' })

const gamesCollection = defineCollection({
    type: 'content',
    schema: z.object({
        title: z.string(),
        icon: z.string().optional(),
        href: z.string(),
    })
});

const projectsCollection = defineCollection({
    type: 'content',
    schema: z.object({
        title: z.string(),
        icon: z.string().optional(),
        href: z.string(),
    })
});

const experienceCollection = defineCollection({
    type: 'content',
    schema: z.object({
        title: z.string(),
        icon: z.string().optional(),
        date: z.date(),
        end: z.date().optional(),
    })
})

export const collections = {
    'resume': resumeCollection,
    'games': gamesCollection,
    'projects': projectsCollection,
    'experience': experienceCollection,
}