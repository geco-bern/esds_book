
This is the source for the text book. For instructions on how to use **bookdown**, see (https://github.com/rstudio/bookdown). Please see the page "Get Started" at https://bookdown.org/home/about/ for how to compile this book.

## How to

- Complete RMarkdown files for respective session with consolidated contents, corresponding to the published Jupyter Notebooks.
- Make sure that your RMarkdown file can be "knitted". 
- If external resources (e.g. a dataset) are used, make sure to read it from some publicly available location. (we'll have to conceive a good way to host datasets and make them accessible) 
- **Do not add datasets to this repository**. We'll look for a solution to handle data. In the meantime, please put all the data on polybox (`4 Datasets`) and soft-link files into the folder `./data` in this repo by `ln -s  ~/polybox/Shared/Data\ Science\ Lecture\ Planning\ -\ shared\ folder/4\ Datasets/filename.csv ./data/` (now you see why it's not advisable to have white spaces in file names).
- If RMarkdowns contain code that takes long (anything above a few seconds) to run, avoid running respective chunk by setting `eval=FALSE` in the chunk options. This still displays the code in the knitted output - which we want. If outputs from compute-intensive code is required for knitting the RMarkdown file, try to come up with a better solution. For example, figures can be created first as PNG, figure files added to the repo and included in the RMarkdown as an image (`![](./dir_of_image/image.png)`).
- Please adopt tidyverse grammar wherever possible (see `02-data_wrangling.Rmd`).
- Avoid html code in the RMarkdown files.