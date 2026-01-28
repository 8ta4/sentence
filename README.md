# sentence

## Make Sentence Make Sense

`sentence` is sentence motions and text objects built for prose.

## Setup

> How do I set up `sentence`?

1. Make sure you're using [`lazy.nvim`](https://github.com/folke/lazy.nvim).

1. Add this block to your `lazy.nvim` configuration:

    ```lua
    {
      "8ta4/sentence",
    }
    ```

## Usage

> Will the `)` motion stop on blank lines?

No. The `)` motion bypasses blank lines. This keeps you moving between thoughts, instead of landing on dead space.

> From Normal mode, will `vis` select anything if the cursor is on a blank line?

Yes. Instead of selecting nothing on a blank line, `vis` selects the next sentence, if one exists.

> From Normal mode, with the cursor on a sentence, does `vas` select its trailing spaces?

Yes. `as` selects the trailing spaces, so operations like `das` don't leave your text messy. `is` selects only the sentence text. This gives `is` and `as` distinct purposes, so you're not wasting keys on redundant behavior.

> Does `sentence` treat `Mr.` as the end of a sentence?

No. `sentence` has rules to ignore the period in unambiguous abbreviations like `Mr.`, `Dr.`, `Mrs.`, and `Ms.`. This stops the plugin from splitting what is linguistically a single sentence. It avoids rules for ambiguous cases like `Jr.` because such rules could make the plugin treat two separate linguistic sentences as one. This keeps the rules simple.
