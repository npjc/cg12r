mtp_wells <- function(nrow, ncol) {
    paste0(rep(LETTERS[1:nrow], each = ncol), sprintf("%02d",rep(1:ncol, nrow)))
}

mtp_labels_from_length <- function(v) {
    switch(EXPR = as.character(length(v)),
           '24' =  mtp_wells(nrow = 4, ncol = 6),
           '48' = mtp_wells(nrow = 6, ncol = 8),
           '96' = mtp_wells(nrow = 8, ncol = 12),
           '384' = mtp_wells(nrow = 16, ncol = 24)
           )
}
