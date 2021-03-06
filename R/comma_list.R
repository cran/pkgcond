

#' Construct a comma separated list
#'
#' Use this utility to create nicely formatted lists for error messages and the like.
#'
#' @param x  a list that can be converted into a character.
#' @param sep the typical separator
#' @param sep2 the separator to use in the case of only two elements.
#' @param sep.last the separator to use between the last and next to last elements when
#'                 there are at least 3 element in the list.
#' @param terminator concatenated to the end after the list is concluded.
#'
#' @examples
#' comma_list(c("you", "I"))
#' comma_list(c("you", "I"), sep2=" & ")
#' comma_list(head(letters), sep.last=', ', term=', ...')
#'
#' @export
comma_list <-
function( x                 #< vector to make into a comma list
        , sep  = ", "       #< separator for multiple elements.
        , sep2 = " and "    #< separator for only two elements.
        , sep.last = ", and " #< separator between last and second to last for more than two elements.
        , terminator = ''   #< ends the list.
        ){
    #! Create a properly formatted comma separated list.
    if (length(x) == 1) return(paste(x))
    else if (length(x) == 2)
        return(paste(x, collapse=sep2))
    else
        return(paste(x, c(rep(sep, length(x)-2), sep.last, terminator), sep='', collapse=''))
}
if(FALSE){#! @testing
    expect_is(comma_list(1), 'character')
    expect_equal(comma_list(1), '1')

    expect_equal(comma_list(1:2), '1 and 2')

    expect_equal(comma_list(1:3), '1, 2, and 3')
}
