
This is the source for the text book. For instructions on how to use **bookdown**, see (https://github.com/rstudio/bookdown). Please see the page "Get Started" at https://bookdown.org/home/about/ for how to compile this book.

## How to

- Complete RMarkdown files for respective session with consolidated contents, corresponding to the published Jupyter Notebooks.
- Make sure that your RMarkdown file can be "knitted". 
- If external resources (e.g. a dataset) are used, make sure to read it from some publicly available location. (we'll have to conceive a good way to host datasets and make them accessible) 
- **Do not add datasets to this repository**. We'll look for a solution to handle data. In the meantime, please put all the data on polybox (`4 Datasets`) and soft-link files into the folder `./data` in this repo by `ln -s  ~/polybox/Shared/Data\ Science\ Lecture\ Planning\ -\ shared\ folder/4\ Datasets/filename.csv ./data/` (now you see why it's not advisable to have white spaces in file names).
- If RMarkdowns contain code that takes long (anything above a few seconds) to run, avoid running respective chunk by setting `eval=FALSE` in the chunk options. This still displays the code in the knitted output - which we want. If outputs from compute-intensive code is required for knitting the RMarkdown file, try to come up with a better solution. For example, figures can be created first as PNG, figure files added to the repo and included in the RMarkdown as an image (`![](./dir_of_image/image.png)`).
- Please adopt tidyverse grammar wherever possible (see `02-data_wrangling.Rmd`).
- Avoid html code in the RMarkdown files.

## Book structure

- Separation of tutorial and exercises even more strict. Avoid any duplication of explanations in the tutorial part.
- Theory must be accessible somehow. Is now in videos. Embed videos as youtube (see [here](https://bookdown.org/yihui/rmarkdown/learnr-videos.html)).
- Add exercises as separate sections into the chapters. 
- Consider reducing contents, boiling it down to the essentials and avoid any duplication of explanations. Anything repetitive is to be relegated to exercises.
- Include all library load statements for each chapter at the top of the respective RMarkdown.
- Libraries should be explained with links to respective documentation pages.

## Formatting

- Strictly follow [Markdown syntax](https://www.markdownguide.org/basic-syntax/) (no html!).
- Apply a sensible hierarchy of sections. Feel free to revise what we initially had.
- Use cross-references to point to figures, sections, etc. See [here](https://bookdown.org/yihui/bookdown/cross-references.html).
- Avoid manual numbering of sections (numbers are automatically rendered).
- Avoid horizontal lines (`---`)
- Please follow naming conventions as defined in `01-primers` (see below). It would be optimal if you could follow the [tidyverse style guide](https://style.tidyverse.org/)

```r
# Good
day_01

# Bad
DayOne
day.one
first_day_of_the_mont
djm1

# Don'ts
mean <- function(x) min(x)
T <- FALSE
c <- 10
```


## Tidyverse

- Remember to use tidyverse functions wherever possible. In particular for the the functionalities described in `02-data_wrangling.Rmd`:
  - variable selection with `select()`
  - filtering/subsetting with `filter()`
  - variable definition with `mutate`
  - merging with the `*_join()` family
  - dates with the *lubridate* package
  - `read_csv()` instead of `read.csv()`
  - `as_tibble()` instead of `as.data.frame()`
  - apply functions over elements of a list using `purrr::map()` family of functions instead of the `apply()` family.