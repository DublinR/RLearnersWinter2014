Improving Speed Performance of Loops
==================================================

Looping over very large data sets can become slow in R. However, this limitation can be overcome by eliminating certain operations in loops or avoiding loops over the data intensive dimension in an object altogether. The latter can be achieved by performing mainly vector-to-vecor or matrix-to-matrix computations which run often over 100 times faster than the corresponding for() or apply() loops in R. For this purpose, one can make use of the existing speed-optimized R functions (e.g.: rowSums, rowMeans, table, tabulate) or one can design custom functions that avoid expensive R loops by using vector- or matrix-based approaches. Alternatively, one can write programs that will perform all time consuming computations on the C-level.