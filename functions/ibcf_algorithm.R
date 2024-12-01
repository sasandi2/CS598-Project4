myIBCF = function(new_user) {
  
  zero_S = as.matrix(read.table("S.txt"))
  zero_S[is.na(zero_S)] = 0
  
  n_movies = nrow(zero_S)
  names(new_user) = colnames(zero_S)
  rated_movies = names(new_user[!is.na(new_user)])
  
  mask = matrix(!is.na(new_user), n_movies, 1)
  denoms = zero_S %*% mask
  new_user[is.na(new_user)] = 0
  numerators = zero_S %*% as.matrix(new_user)
  
  predictions = numerators / denoms
  predictions[!is.finite(predictions)] = NA
  names(predictions) = colnames(zero_S)
  
  sorted_preds = sort(predictions, decreasing = TRUE, na.last = TRUE)
  
  non_na_preds = sum(!is.na(sorted_preds))
  if ( non_na_preds < 10) {
    ranked_names = read.delim("popularity_rank", header = FALSE)
    result = setdiff(ranked_names[,1], rated_movies)[(non_na_preds+1):10]
  } else {
    result = names(sorted_preds)[1:10]
  }
  
  return (sorted_preds[result])
  
}