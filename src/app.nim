include karax / prelude
import std / [dom, random]

type
  Quote = ref object
    text, author: cstring

template `^`(s: string): cstring = cstring(s)

let quotes = @[
  Quote(text: "One thing i know, that i know nothing. This is the source of my wisdom.", author: "Socrates"),
  Quote(text: "Love is composed of a single soul inhabiting two bodies.", author: "Aristotle"),
  Quote(text: "There is nothing permanent except change.", author: "Heraclitus"),
  Quote(text: "I am indebted to my father for living, but to my teacher for living well.", author: "Alexander the Great"),
  Quote(text: "He who steals a little steals with the same wish as he who steals much, but with less power.", author: "Plato"),
  Quote(text: "Let no man be called happy before his death. Till then, he is not happy, only lucky.", author: "Solon"),
  Quote(text: "By all means, get married: if you find a good wife, you'll be happy; if not, you'll become a philosopher.", author: "Socrates"),
  Quote(text: "Small opportunities are often the beginning of great enterprises.", author: "Demosthenes")
]

randomize()
var current = sample(quotes)

proc createDom(): VNode =
  result = buildHtml:
    tdiv(class = "flex flex-col items-center justify-center min-h-screen p-10 bg-blurred bg-center bg-cover"):
      h1(class = "font-light text-3xl md:text-4xl text-gray-600 mb-8 md:mb-12"):
        text ^"Ancient Wisdom"
      tdiv(class = "relative w-full md:w-3/4 lg:w-1/2"):
        tdiv(class = "flex card"):
          img(src = "img/portrait.jpg", width = "512", height = "512", class = "object-cover h-auto w-1/2", alt = "")
          tdiv(class = "p-4 w-1/2"):
            span(class = "font-semibold italic text-base text-gray-600"):
              text ^"“" & current.text & ^"”"
            span(class = "block text-lg font-light text-gray-400"):
              text ^"— " & current.author
        tdiv(class = "flex justify-center mt-4 md:mt-8 md:absolute md:right-0"):
          button(class = "btn btn-primary"):
            var laziness = false
            proc onClick() =
              if not laziness:
                laziness = true
                current = sample(quotes)
                discard setTimeout(proc () = laziness = false, 500)
            text ^"New quote"

setRenderer createDom
