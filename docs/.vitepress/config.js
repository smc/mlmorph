
const pkg = require("../package.json");
const container = require('markdown-it-container')
function createContainer(klass, defaultTitle = "") {
  return [
    container,
    klass,
    {
      render(tokens, idx) {
        const token = tokens[idx]
        const info = token.info.trim().slice(klass.length).trim()
        if (token.nesting === 1) {
          return `<div class="${klass} custom-block"><p class="custom-block-title">${info || defaultTitle
            }</p>\n`
        } else {
          return `</div>\n`
        }
      }
    }
  ]
}

module.exports = {
  title: "Malayalam morphology analyser",
  description: pkg.description,
  head: [["meta", { property: "og:description", content: pkg.description }]],
  themeConfig: {
    repo: "smc/mlmorph",
    docsDir: "docs",
    editLinks: true,
    nav: [
      {
        text: 'Documentation',
        link: '/'
      },
      {
        text: 'Analyser',
        link: '/analyser'
      },
      {
        text: 'Generator',
        link: '/generator'
      },
      {
        text: 'Spellchecker',
        link: '/spellcheck'
      },
      {
        text: 'SMC',
        link: 'https://smc.org.in'
      }
    ],
    sidebar: [
      {
        text: "Getting Started",
        items: [
          { text: "Malayalam morphology analyser", link: "/" },
          { text: "Part of speech tags", link: "/pos" },
          { text: "Finite State Transducer", link: "/fst" },
          { text: "History", link: "/history" },
          { text: "Frequently asked questions", link: "/faq" },
          { text: "Reference", link: "/reference" },
        ],
      },
      {
        text: "Lexicon",
        items: [
          { text: "Introduction", link: "/lexicon/" },
          { text: "Nouns", link: "/lexicon/nouns" },
          { text: "Verbs", link: "/lexicon/verbs" },
        ],
      },
      {
        text: "Morphology",
        items: [
          {
            text: "Nominal inflections",
            link: "/ninfl/",
            items: [
              { text: "Cases", link: "/ninfl/cases" },
              { text: "Number", link: "/ninfl/number" }
            ]
          },
          {
            text: "Verbal inflections", link: "/vinfl/",
            items: [
              { text: "Tense", link: "/vinfl/tense" },
              { text: "Aspect", link: "/vinfl/aspect" },
              { text: "Mood", link: "/vinfl/mood" },
              { text: "Voice", link: "/vinfl/voice" },
              { text: "Clauses", link: "/vinfl/clauses" },
              { text: "Questions", link: "/vinfl/questions" },
            ]
          },
          { text: "Cardinals", link: "/cardinals" },
        ],
      },
      {
        text: "Phonology",
        link: "/phon/",
      },
      {
        text: "Derivational morphology",
        link: "/deriv/",
        items: [
          { text: "Verbal nouns", link: "/deriv/noun-from-verb" }
        ]
      },
      {
        text: "Using mlmorph",
        items: [
          {
            text: "Python API",
            link: "/dev/python",
          },
          { text: "Web API", link: "/dev/web" },
        ],
      },
      {
        text: "Applications",
        items: [
          {
            text: "Morphology analyser",
            link: "/analyser",
          },
          {
            text: "Morphology generator",
            link: "/generator",
          },
          {
            text: "Spelling checker",
            link: "/spellcheck",
          },
          {
            text: "Number analysis",
            link: "/number",
          },
          {
            text: "Named entity recognition",
            link: "/ner",
          },
        ],
      },
    ]
  },
  markdown: {
    // options for markdown-it-anchor
    anchor: { permalink: false },

    // options for markdown-it-toc
    toc: { includeLevel: [1, 2] },

    config: (md) => {
      md.use(...createContainer('rule'))
      md.use(...createContainer('example', 'Examples'))
    }
  },

};