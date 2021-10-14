# Group effect and individual effect can't be estimated at the same time
sdata = data.frame(y=rnorm(12),
                   id=rep(1:4,3),
                   group=rep(c(2,1,1,2),3))
sdata
mod = lm(y~0+factor(id)+factor(group), data=sdata)
summary(mod)

X = matrix(c(0,0,0,1,
             1,0,0,0,
             0,1,0,0,
             0,0,1,1), c(4,4), byrow=T)
X
solve(X)
solve(t(X)%*%X)

X = matrix(c(0,0,0,0,
             1,0,0,0,
             0,1,0,1,
             0,0,1,1), c(4,4), byrow=T)
X
solve(X)
solve(t(X)%*%X)
