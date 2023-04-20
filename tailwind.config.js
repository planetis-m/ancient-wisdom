/** @type {import('tailwindcss').Config} */

module.exports = {
  content: ["./src/app.nim"],
  theme: {
    extend: {
      colors: {
        primary: '#75798d',
        highlight: '#a4a7b4',
      },
      backgroundImage: {
        'blurred': "url('img/blurred.jpg')",
      },
    },
  },
  plugins: [],
}
