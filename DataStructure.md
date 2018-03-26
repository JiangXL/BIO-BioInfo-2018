
## Suffix Tree

In computer science, a suffix tree is a compressed trie containing all the
suffixes of the given text as their keys and positions in the text as their
value. Suffix trees allow particulary fast implementations of many important
string operations.

The suffix tree for the string S of length n is defined as a tree such that:
- The tree has exactly n leaves numbered from 1 to n.
- Except for the root, every internal node has at least two children.
- Each edge is labelled with a non-empty substring of S.
- No two edges starting out of a node can have string-labels beginning with
the same character.???
- The string obtained by concatenating all the string-labels found on the 
path from the root to leaf i spells out suffix S[i..n], for i from 1 to n.

Since such a tree does not exist for all strings, S is padded with a terminal
symbol not seen in the string. This ensures that no suffix is a prefix of another, and that there will be {\displaystyle n} n leaf nodes, one for each of the {\displaystyle n} n suffixes of {\displaystyle S} S. Since all internal non-root nodes are branching, there can be at most n −  1 such nodes, and n + (n − 1) + 1 = 2n nodes in total (n leaves, n − 1 internal non-root nodes, 1 root).

## Suffix Array
A suffix arrray is a sorted array of all suffixes of a string.a\


Let S=S[1]S[2]...S[n] be a string and let S[i,j] denote the substring of S 
ranging from i to j.

The suffix array A of S is now defined to be an array of integers providing 
the starting positions of suffixes of S in lexicographical order. This means,
an entry A[i] contains the starting position of the i-th smallest suffix in 
S and thus for all  $1<ileq n: S[A[i-1],n] < S[A[i],n]

## Tally(Count sorting)

