# FACTOR STRUCTURE

library(psych)
items <- read.csv("data/items_l.csv")

# Parallel analysis
pa <- fa(items) # min res factor analysis
pa
fa.graph(pa)
fa.diagram(pa)
fa.parallel(items)

# Eigenvalues of polychoric correlation matrix
evalues <- eigen(polychoric(items)$rho)$values
evalues
library(nFactors)
plotnScree(nScree(evalues, model="factors"), main="Scree Plot & Parallel Analysis")

# Extract factors using principal axis factoring
efa.out<-fa.poly(x=items, fm="pa", nfactors=2, rotate="promax", residual=TRUE, sort=TRUE)
print(efa.out$fa$loadings, cutoff=0)

# Cluster analysis from two clusters
iq.clus <- ICLUST(items)
fit <- cluster.fit(r.mat,iq.clus$loadings,iq.clus$clusters)
fit

# Minres factor solutions of between one and six (correlated) dimensions
factors <- fa(items, cor = "poly")
print(factors)

# Although the ratio of the first to second eigenvalues (7.3 to 3.4) is somewhat 
# suggestive of a dominant first factor, from all analyses we concluded that there 
# were between four and six discernable dimensions. Because six was the a priori hypothesis, 
# for illustrative purposes we assume that six is the appropriate dimensionality. 
# The finding of six factors is not necessarily inconsistent with unidimensionality; 
# there could be one strong factor and several smaller “nuisance” dimensions caused by 
# parcels of item content that are highly intercorrelated because they measure the same 
# aspect of the construct.

# BIFACTOR MODEL

# Schmid–Leiman orthogonalization (# see p. 334 in ref. manual)
schmid(model, nfactors = 3, fm = "minres",digits=2,rotate="oblimin",
       n.obs=NA,option="equal",Phi=NULL,covar=FALSE,two.ok=FALSE,...) 

# coefficient omega hierarchical (see p. 265 in psych reference manual)
omega(m,nfactors=3,fm="minres",n.iter=1,p=.05,poly=FALSE,key=NULL,
      flip=TRUE,digits=2, title="Omega",sl=TRUE,labels=NULL,
      plot=TRUE,n.obs=NA,rotate="oblimin",Phi=NULL,option="equal",covar=FALSE, ...)

