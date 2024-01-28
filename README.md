# Principles Of Designing Secure Smart Contracts

## Source: Guardian: Advanced Web3 Security Course 
- https://guardianaudits.notion.site/guardianaudits/Gateway-Free-Web3-Security-Course-574f4d819c144d7895cda6d61ba26503

## Personal Notes: Notion
https://www.notion.so/Notes-Advanced-Web3-Security-09f7ff14473245b4b80a487d803a3fdd

**Goal**

Share some of my experiences and learnings on designing secure smart contracts. This will not only make you a better Web3 developer, but it will give you those code smells when something isn’t designed well — you’ll know to dig in there and uncover the issues with it.

**Notes**

- Minimal code necessary → Often as succinct as possible is best, more code more complexity, more room for error. Best way to do this is to start by being extremely picky about the storage variables you use. Simplify your storage variables as succinctly as appropriate for your system and then your code will follow.
- Simple examples: extra mapping from PariFi, conversion from percent to liquidity amount in Limit.
- Spend the time to thoroughly think through each design decision before you head down that route. Attempt to envision how it will look and work with all other features, how will it behave on edge cases. Spend more time away from the computer thinking about the system than you do writing it. Blast of writing when you get back. Whiteboard it out, talk to others about it.
- Being a good developer goes beyond writing good code, it’s thinking about good designs. → Affects your code more than anything. We’ll see how bad design choices can cause insurmountable security issues later.
- Okay so let’s talk about some more atomic characteristics of well designed secure smart contracts, beyond just designing your code as simply as possible.
- Avoid for-loops. Cannot loop through every position due to the EVM.
- Limit the user to exactly what you expect of them. This might seem obvious, but unless we explicitly adopt this doctrine we’re prone to allowing something we don’t expect — more often than not this is what bites developers in the butt.
- So what does this look like: If I don’t expect someone to be able to create a decrease order for a position that is empty, I should validate it up front at the beginning of the decreasePosition function — kill those edge case codepaths in the beginning, rather than letting them live on and cause disaster. All these different codepaths are what cause critical bugs → draw codepaths higher chance of one of these doing something unexpected.
- Handle all cases → One unhandled edge case can lead to catastrophe, insolvent liquidations
- Never use parallel data structures → [Min.fi](http://Min.fi) experience
- External calls, DoS, Gas, Reentrancy (Intra-contract, intra-system “read-only”)
- Post-checks → GMX V2 example, show slip up
- Documentation

**Summary**

- Make contracts as simple as possible, minimal logic necessary [PariFi, Limit]
- Clearly define and limit what actions a user can take [Decrease an empty position]
- Handle all possible edge cases, no matter how rare [Insolvent Liquidation]
- Never use parallel data structures [Min.fi]
- Be exceedingly cautious of external calls → DoS, Gas, Reentrancy (CEI), Return values
- Implement post checks [GMX V2 & finding]
- Documentation (README → high level overview, user flow, Function docstrings with purpose, gotchas parameters and return values) [Blueberry]
