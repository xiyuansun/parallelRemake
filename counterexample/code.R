# storr won't work for caching between instances of remake. to see this:
# 1. Run Rscript -e 'remake::make(remake_file = "remake1.yml")'
# 2. Run Rscript -e 'remake::make(remake_file = "remake2.yml")'
# 3. Uncomment the 2nd line in download_data
# 4. Rerun (1) and then (2).
# 5. Verify that the plot was not rebuilt even though the `data` was changed.

download_data = function(){
  data(mtcars)
 # mtcars$cyl = mtcars$cyl + 5
  mtcars
}

myplot = function(d){
  plot(cyl ~ mpg, data = d)
}

my_set = function(key, value){
  st = storr_rds("my_storr")
  st$set(key, value)
}

my_get = function(key){
  st = storr_rds("my_storr")
  st$get(key)
}
