
const pkg = require("../package.json");
const container = require('markdown-it-container')
function createContainer(klass, defaultTitle="")  {
  return [
    container,
    klass,
    {
      render(tokens, idx) {
        const token = tokens[idx]
        const info = token.info.trim().slice(klass.length).trim()
        if (token.nesting === 1) {
          return `<div class="${klass} custom-block"><p class="custom-block-title">${
            info || defaultTitle
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
        text: 'SMC',
        link: 'https://smc.org.in'
      }
    ],
    sidebar: [
      {
        text: "Getting Started",
        children: [
          { text: "Malayalam morphology analyser", link: "/" },
          { text: "POS", link: "/pos" },
          { text: "Technology", link: "/fst" },
        ],
      },
      {
        text: "Lexicon",
        children: [
          { text: "Introduction", link: "/lexicon/" },
          { text: "Nouns", link: "/lexicon/nouns" },
          { text: "Verbs", link: "/lexicon/verbs" },
        ],
      },
      {
        text: "Morphology",
        children: [
          { text: "Nominal inflections",
             link: "/ninfl/",
             children: [
                { text: "Cases", link: "/ninfl/cases" }
              ]
          },
          { text: "Verbal inflections", link: "/vinfl" },
          { text: "Cardinals", link: "/cardinals" },
        ],
      },
      {
        text: "Phonology",
        children: [
          {
            text: "Exceptions",
            link: "/phon/exceptions",
          },
        ],
      },
      {
        text: "Using mlmorph",
        children: [
          {
            text: "Python API",
            link: "/dev/python",
          },
          { text: "Web API", link: "/dev/web" },
        ],
      },
    ],
  },
  markdown: {
    // options for markdown-it-anchor
    anchor: { permalink: false },

    // options for markdown-it-toc
    toc: { includeLevel: [1, 2] },

    config: (md) => {
      md.use(...createContainer('rule' ))
      md.use(...createContainer('example', 'Examples'))
    }
  }
};