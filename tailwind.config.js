import defaultTheme from 'tailwindcss/defaultTheme';
import forms from '@tailwindcss/forms';
import typography from '@tailwindcss/typography';

/** @type {import('tailwindcss').Config} */
export default {
    content: [
        './vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php',
        './vendor/laravel/jetstream/**/*.blade.php',
        './storage/framework/views/*.php',
        './resources/views/**/*.blade.php',
        './resources/js/**/*.vue',
    ],

    theme: {
        extend: {
            fontFamily: {
                sans: ['Figtree', ...defaultTheme.fontFamily.sans],
            },
            colors: {
                'rhino': {
                    '50': '#f3f6fb',
                    '100': '#e4ecf5',
                    '200': '#cfdeee',
                    '300': '#adc8e3',
                    '400': '#86abd4',
                    '500': '#6990c8',
                    '600': '#5678ba',
                    '700': '#4b67aa',
                    '800': '#42558b',
                    '900': '#2f3c5c',
                    '950': '#262e45',
                },
            },            
        },
    },

    plugins: [forms, typography],

    darkMode: 'selector',
};
