#' @title Function \code{remember}
#' @description Loads an object from the \code{storr} cache. Defaults
#' to the cache used by \code{remake}.
#' @export
#' @return An object from the cache
#' @param ... Objects to load from cache
#' @param cache Character vector, path to \code{storr} cache to load from.
remember = function(..., cache = ".remake/objects"){
  args = structure(as.list(match.call()[-1]), class = "uneval")
  args = as.character(args)
  st = storr_rds(cache)
  out = lapply(args, st$get)
  names(out) = args
  if(length(out) < 2) out = out[[1]]
  out
}
