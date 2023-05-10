DATADIR <- here::here("data")
files_by_year <- list.files(DATADIR, pattern="birdsSeen_.*txt")
birds_by_year <- NULL
for(f in files_by_year) {
  b <- read.table(file.path(DATADIR, f), sep=",", quote="")
  names(b) <- c("Species", "SeenBy")
  date <- as.Date(f, format="birdsSeen_%Y%m%d.txt")
  year <- lubridate::year(date)
  d <- cbind(b, Year=rep(year, nrow(b)))
  birds_by_year <- rbind(birds_by_year, d)
}
write.table(birds_by_year, file=file.path(DATADIR, "BirdsSeenByYear.csv"),
  sep=",", row.names=FALSE)
