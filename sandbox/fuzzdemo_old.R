################################################################################
# Description: A Demo of the Package fuzztest (a work in progress)
# Author: cloudcell 
# Date: 2016-02-29
################################################################################


# options: a,b,c,d,e,f
# suboptions: a,b,c,d

################################################################################
# Description of the demo:
# This example might seem a bit contrived. Nevertheless, it fulfills its purpose, 
# which  is to demonstrate how to test functions with a long list of options

# This package is just a framework one can extend as one sees fit during testing.

# TODO: add to the description of the package: the package does not try to
#       hide the testing environment object to make the process more
#       transparent (be sure not to delete it unless you really mean it).

if(0) { # test for the Wiki
    
    set.seed(0)
    
    r <- list()
    r$x <- as.list(runif(3))
    r$y <- as.list(runif(3))
    r$option <- c("a","b","c","d","e","f","g","h","i")
    r$suboption <- c("a","b","c","d")
    
    # TODO: prepare and store an argument test set in a separate environment
    # .stresstest.env or '.stress'
    generate.argset(arg_register = r)
    
    # produce results {PASS,FAIL} for every argument test set
    apply.argset(FUN="fuzzdemofunc") # , subset=c(1,5,222,333,444,555,666,777,888,999,41472)
    
    # print test summary
    test_summary()
    
    plot.tests()
}

if(0) { # test for testing the package itself
    
    ## ATTENTION: do not use 'lists' in the top level if possible
    set.seed(0)
    r <- list()
    r$x <- c(runif(100),0)
    r$y <- c(runif(100),0)
    r$option <- c("a")
    r$suboption <- c("d")
    # r$option <- c("a", "b", "c", "d", "e", "f")
    # r$option <- c("a","b","c","d")
    # r$option <- c("break","breako")
    # r$suboption <- c("a","b","c","d")
    # r$suboption <- c("c")
    # r$suboption <- c("c","d")
    # r$suboption <- c("break", "break")
    
    # TODO: prepare and store an argument test set in a separate environment
    # .stresstest.env or '.stress'
    # creates a new "cont.env" environment
    generate.argset(arg_register = r, display_progress=TRUE) #, DEBUG = T)
    
    # produce results {PASS,FAIL} for every argument test set
    apply.argset(FUN="fuzzdemofunc") # , subset=c(1,5,222,333,444,555,666,777,888,999,41472)
    
    # print test summary
    test_summary(DEBUG = FALSE)#, verbose=TRUE)
    
    # plot.tests(DEBUG=TRUE,verbose=TRUE)
    # plot.tests(DEBUG=FALSE,verbose=TRUE)
    plot.tests()#DEBUG=FALSE,verbose=TRUE)
    
    
    
    # plot.tests(DEBUG=TRUE)
    # fuzzdemofunc(x=0,y=10,"a","break")
}

if(0) {
    # using runif() for this type of a chart might be not such a good idea
    # as the cardinal number associated with the parameter value have 
    # correlation. 
    # 
    # A better approach would be to cover some specified range assigning
    # values to x and y in an ascending order along with the cardinal
    # number of the argument option. Here's the code:
    
    ## ATTENTION: do not use 'lists' in the top level if possible
    set.seed(0)
    r <- list()
    r$x <- c(seq(from=0, to=1, length.out = 50))
    r$y <- c(seq(from=0, to=1, length.out = 50))
    r$option <- c("a")
    r$suboption <- c("d")
    
    generate.argset(arg_register = r, display_progress=TRUE) #, DEBUG = T)
    
    apply.argset(FUN="fuzzdemofunc") # , subset=c(1,5,222,333,444,555,666,777,888,999,41472)
    test_summary()
    plot.tests()
    
}

if(0) {
    
    ## ATTENTION: do not use 'lists' in the top level if possible
    set.seed(0)
    r <- list()
    r$x <- c(1,2,3,4) # c(seq(from=0, to=1, length.out = 50))
    r$y <- c(1,2,3,4)#,5,6) # c(seq(from=0, to=1, length.out = 50))
    r$option <- c("a","d","f")
    r$suboption <- c("c","d")
    
    generate.argset(arg_register = r, display_progress=TRUE) #, DEBUG = T)
    
    apply.argset(FUN="fuzzdemofunc") # , subset=c(1,5,222,333,444,555,666,777,888,999,41472)
    test_summary()
    plot.tests()
    
}

# TEXT: the key to clarity is to arrange axes the right way

if(0) {
    
    ## ATTENTION: do not use 'lists' in the top level if possible
    set.seed(0)
    r <- list()
    r$x <- c(1,2,3,4) # c(seq(from=0, to=1, length.out = 50))
    r$y <- c(1,2,3,4)#,5,6) # c(seq(from=0, to=1, length.out = 50))
    r$option <- c("b") # might be rearranged (shifted down or up)
    r$suboption <- c("a", "b", "c", "d")
    
    generate.argset(arg_register = r, display_progress=TRUE) #, DEBUG = T)
    
    apply.argset(FUN="fuzzdemofunc") # , subset=c(1,5,222,333,444,555,666,777,888,999,41472)
    test_summary()
    plot.tests()
    
}

if(0) {
    
    # Now, suppose we fixed the bug with 'suboption b', what are the rest?
    # 
    set.seed(0)
    r <- list()
    r$x <- c(1,2,3,4) # c(seq(from=0, to=1, length.out = 50))
    r$y <- c(1,2,3,4)#,5,6) # c(seq(from=0, to=1, length.out = 50))
    r$suboption <- c("a", "c", "d")
    r$option <- c("b")
    
    generate.argset(arg_register = r, display_progress=TRUE) #, DEBUG = T)
    
    apply.argset(FUN="fuzzdemofunc") # , subset=c(1,5,222,333,444,555,666,777,888,999,41472)
    test_summary()
    plot.tests()
    
    # so the chart shows that option and suboption do not really matter,
    # then let's try using multiple combinations of x and y while using
    # only one option/suboption pair next
}

if(0) {
    
    ## demo_fuzz_05_scan_numeric_params.png
    set.seed(0)
    r <- list()
    r$x <- c(seq(from=0, to=1, length.out = 50))
    r$y <- c(seq(from=0, to=1, length.out = 50))
    r$option <- c("b")
    r$suboption <- c("a")
    
    generate.argset(arg_register = r, display_progress=TRUE) #, DEBUG = T)
    
    apply.argset(FUN="fuzzdemofunc") # , subset=c(1,5,222,333,444,555,666,777,888,999,41472)
    test_summary()
    plot.tests(pass = FALSE, fail = FALSE)
    plot.tests(pass = FALSE)
    plot.tests(fail = FALSE)
    plot.tests(pass = FALSE, fail = FALSE, DEBUG = TRUE)
    plot.tests()
    plot.tests(DEBUG = T)
    
}

################################################################################
# Notes:
# 
# Vertical axes are equally split among options; in case there is only one
# option occupies the axis "test lines" will be evenly spread from the bottom
# to the top of the chart.
# 
# The chart is drawn as follows.
# First, all test lines for those tests that returned the PASS status. They
# Second, all the test lines for FAIL tests.
# All the test lines are drawn in such a way so that when the lines intersect
# axes, no line occludes another line. I.e. each test line must be visible
# at such junction points with FAIL test lines occupying the lower portion
# of the range allocated for each 'option' on an axis.
# 
# 
# Ref on Multi-D Datamining: 
# * http://web.cs.ucdavis.edu/~ma/ECS289H/papers/Inselberg1997.pdf
# * https://syntagmatic.github.io/parallel-coordinates/examples/table.html
################################################################################
