# Short-termism in academia, or "I got Claude to rewrite this in Rust!"

Having seen the latest in a long line of LinkedIn posts, complete with AI-written body, proudly announcing
that "I [Claude] and my team [Claude] translated X bioinformatic tool into X-rs for a [Dubious Number] speedup!",
I finally reached my tipping point and am now compelled to ragepost about it.

To be clear, I have no qualm with Rust, or, at least in principle, using AI in software development. I
use AI quite regularly myself, and I think without it I may not have been able to find much of the
knowledge I now rely on. I've heard AI called "glorified Google search" in a pejorative sense; in
fact that is by far the most utopian and democratising facet of its abilities. And I certainly
agree that we should try to make bioinformatic algorithms more performant. I've firmly planted
my flag on that point throughout my career. All this to say that I'm not attempting to make a moral
argument against the use of AI*, or to argue that the outcome, a faster algorithm, is any bad thing.
But the process by which these projects are being created seems to me either deeply cynical, or
tragically misguided.

---

**Objection 1**:  
In many cases, these efforts could have been offered as pull requests. This would have been more in the
spirit of collaboration and would have created a lot less technical debt. Instead, there are now
two repos rather than one, with potentially divergent future trajectories. The realist
in me will admit that any pull requests opened on a bioinformatic algorithm would most likely have
been ignored entirely, but that problem is not solved by having Claude translate the repo into an
alternate language. The cynic in me will note that a new repo, and possible publication, looks a lot
more impressive than a pull request.

It also strikes me that it can't be a positive experience to produce and maintain a tool, the product
of years of work and learning, only to wake up some day and discover that someone has had the
bright idea of pointing Claude at it - and is now claiming that work as their own for having done so.
I am dramatising here though.

**Objection 2**:  
If Claude goes away, can these tools be maintained? Is there even any intention of doing so? Did
the author actually learn to write performant Rust in the process? If not, then all these projects
are creating is e-waste. I would imagine some of the authors might protest that they did learn
to write performant Rust through the process, and I believe that may be true. But the spectre
of proliferating articles like
[AI Assistance Reduces Persistence and Hurts Independent Performance](https://arxiv.org/pdf/2604.04721)
looms large.

Research already has an unfortunate tendency to treat software as disposable, single-publication objects.
The ability to point Claude at an existing repository and, as if by magic, get an ostensibly working product
out the other end is not helping. I've spent far too much time in the last couple of years clearing up
after projects that thought they could get ahead with AI, and ended up with a tool that was totally
unmaintainable, produced the wrong results, or both.

**Objection 3**:  
What, if anything, was learned from this work? The point, I naively hope, of academic research is to further human knowledge.
Human in the collective sense, all of us, but also human in the individual sense.
The effort made in solving hard problems is what trains a good researcher.
Becoming deeply involved with a problem is what allows us to develop new and insightful solutions (not to mention identify and prevent mistakes).
The output alone is truly and tangibly not the whole, and to ignore that is short-termism at its absolute worst.

This one is I think the most important.

---

I can't claim to know if these authors (if that is even the correct word) are being
genuinely cynical, or if they feel this is a legitimate contribution to the academic world. I almost hope
the former, as it's at least the less tragic option - for whatever that's worth. I also want to
stress that I'm not suggesting if you use AI in development that you're fundamentally evil etc. Hopefully
the specific nature of my objections makes that clear.

Finally, and I'm entirely cribbing from [Casey Muratori](https://www.computerenhance.com/) here,
but it bears repeating that this is not a particularly compelling or interesting test of AI's
capability to further research. If you provide Claude with a complete working program you
have essentially given it the most extensive spec you possibly could. This is not hard or difficult
work for the AI (nor the authors).


*My own usage notwithstanding, there are moral arguments to be made; they're just not the point of this post.
