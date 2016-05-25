generate_data = function(){
  data.frame(
    x = rnorm(1000), 
    y = rnorm(1000, mean = 16)
  )
}

my_plot = function(column_means){
  plot(y ~ x, data = do.call(rbind, column_means))
}
