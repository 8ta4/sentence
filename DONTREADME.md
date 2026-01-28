# sentence

## Goals

### Latency

> What's the latency target?

The goal is under 0.1 seconds.

[0.1 second is about the limit for having the user feel that the system is reacting instantaneously](https://www.nngroup.com/articles/response-times-3-important-limits/#:~:text=0.1%20second%20is%20about%20the%20limit%20for%20having%20the%20user%20feel%20that%20the%20system%20is%20reacting%20instantaneously).

### Extensibility

> When the cursor is on a sentence, can I programmatically get the sentence's start position?

Yes. The Lua function `sentence.get()` gives you the start and end coordinates of a sentence. You pass it an integer offset to get any sentence relative to the cursor, like the previous, current, or next one. It's built to be a foundation for other plugins.
