import { defineConfig } from 'astro/config';
import tailwind from '@astrojs/tailwind';

// https://astro.build/config
export default defineConfig({
	build: {
		site: 'https://nullzueins.github.io/tagesmutter-peters-de',
	},
	integrations: [tailwind()],
	output: "static",
})
