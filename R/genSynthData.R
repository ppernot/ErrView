# Init ####

# Install packages if necessary
libs <- c(
  'moments','PDQutils'
)
for (lib in libs) {
  if (!require(lib, character.only = TRUE, quietly = TRUE)) {
    install.packages(
      lib,
      dependencies = TRUE,
      repos = "https://cran.univ-paris1.fr"
    )
    library(lib, character.only = TRUE)
  }
}

# Define Data and Results repositories
dataRepo = '../data/'

# Functions ####
rgh = function(n,g,h) {
  # g-and-h random numbers
  x = rnorm(n,0,1)
  if (g == 0)
    x = x * exp(h * x^2/2)
  if (g > 0)
    x = (exp(g * x) - 1) * exp(h * x^2/2)/g
  return(x)
}
genData <- function(
  N,
  case,
  alpha = 0.02,
  g=0.5, h=0.5,
  a = 1, b = 1.2,
  sig  = 1,
  skew = 0,
  kurt = 3,
  refDist = 'norm',
  iseed = 1234) {

  set.seed(iseed)

  # Ref data
  if(refDist == 'norm')
    ref0 = rnorm(N)
  else
    ref0 = 10* runif(N) - 5

  # Error model
  if(case == 'norm') {
    err = rnorm(N,0,1)
  }  else if (case == 'stud') {
    err = rt(N,df=4)
  }  else if (case == 'gh02') {
    err =  rgh(N,0,h)
  }  else if (case == 'gh20') {
    err =  rgh(N,g,0)
  }  else if (case == 'gh22') {
    err =  rgh(N,g,h)
  } else if (case == 'binorm') {
    n1 = floor(3 * N / 4)
    err = c(rnorm(n1,0,1),rnorm(N-n1,0,5))
    err = sample(err,N)
  } else if (case == 'cf') {
    cum = PDQutils::moment2cumulant(
      c(0,sig^2,sig^3*skew,sig^4*kurt))
    err = PDQutils::rapx_cf(N, cum)
  }

  # Introduce heteroscedasticity
  het = exp(-alpha * (ref0-min(ref0)))
  err = 0.01 * err * het + a + b * ref0

  # Generate biased dataset
  ref  = ref0
  calc = ref - err

  return(
    list(
      calc = calc,
      ref  = ref,
      err  = err
    )
  )
}

# Synthetic data ####

skew = 1
kurt = 8
alpha = -0.2
a= 1; b = 0.05

for (N in c(50, 100, 1000)) {
  # Datasets with common ref. values
  allData = c()
  for (case in c('norm','binorm','cf')) {
    for(alpha in c(0,-0.2)) {
      data = genData(
        N, case,
        a = a, b= b,
        alpha = alpha,
        skew = skew,
        kurt = kurt
      )
      # plot(data$calc,data$ref-data$calc)
      if(is.null(allData$Ref))
        allData[['Ref']] = data$ref
      tag = paste0(
        case,'_',
        ifelse(alpha==0,'hom','het')
      )
      allData[[paste0(tag)]] = data$calc
    }
  }
  write.csv(
    data.frame(allData),
    file = paste0(
      dataRepo,'Synth_',N,'.csv')
  )

}
