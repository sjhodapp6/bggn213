Untitled
================

Read in csv file from the PDB site

``` r
db <- read.csv("Data Export Summary.csv", row.names=1)
head(db)
```

    ##                          X.ray   NMR   EM Multiple.methods Neutron Other  Total
    ## Protein (only)          142419 11807 6038              177      70    32 160543
    ## Protein/Oligosaccharide   8426    31  991                5       0     0   9453
    ## Protein/NA                7498   274 2000                3       0     0   9775
    ## Nucleic acid (only)       2368  1378   60                8       2     1   3817
    ## Other                      149    31    3                0       0     0    183
    ## Oligosaccharide (only)      11     6    0                1       0     4     22

> Q1: What percentage of structures in the PDB are solved by X-Ray and
> Electron Microscopy.

``` r
sum(db$X.ray)/sum(db$Total) # 0.8752836 = 87.53% of structures are solved by X-Ray
```

    ## [1] 0.8752836

``` r
sum(db$EM)/sum(db$Total) # 0.0494687 = 4.95% of structures are solved by EM
```

    ## [1] 0.0494687

``` r
round((colSums(db) / sum(db$Total)) * 100, 2) # percentage of structures in the PDB that are solved by each technique
```

    ##            X.ray              NMR               EM Multiple.methods 
    ##            87.53             7.36             4.95             0.11 
    ##          Neutron            Other            Total 
    ##             0.04             0.02           100.00

> Q2: What proportion of structures in the PDB are protein?

``` r
round((db$Total[1]/sum(db$Total)) * 100, 2) # 87.35%
```

    ## [1] 87.35

> Q3: Type HIV in the PDB website search box on the home page and
> determine how many HIV-1 protease structures are in the current PDB?
> 23409

![](myvmdpic.png)
