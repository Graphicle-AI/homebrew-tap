# graphicle-ai/homebrew-tap

The Homebrew tap for [Graphicle](https://github.com/graphicle-ai/graphicle):
code graph and memory for your coding agents.

```sh
brew install graphicle-ai/tap/graphicle
cd your-repo && graphicle setup
```

- **Upgrade:** `brew upgrade graphicle`, then `graphicle doctor --fix`, which
  repairs agent entries that still start the previous version.
- **Uninstall:** `graphicle uninstall` removes what Graphicle added to your
  agents and repositories, then `brew uninstall graphicle` removes the program.

`Formula/graphicle.rb` is written by Graphicle's release workflow from
`packaging/homebrew/graphicle.rb.in` in
[graphicle-ai/graphicle](https://github.com/graphicle-ai/graphicle). Change the
template there, not the formula here, and report problems there too:
[open an issue](https://github.com/graphicle-ai/graphicle/issues/new/choose).
