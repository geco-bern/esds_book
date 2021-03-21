# Introduction

- This document holds inputs and ideas on how to further structure and format the ESDS bookdown document.
- This [Google Sheet](https://docs.google.com/spreadsheets/d/1H0F2ZLbEkt5nRRLzCFapwYDbXwXQozB7j-nAjd1eQYY/edit#gid=1623479706) holds a visual overview of the book's progress.

# Table of contents
- [Introduction](#introduction)
- [Table of contents](#table-of-contents)
- [How to use this book](#how-to-use-this-book)
  * [Git](#git)
    + [Set-Up](#set-up)
    + [Workflow](#workflow)
  * [Bookdown](#bookdown)
    + [General](#general)
    + [Structure](#structure)
    + [Tips for RMarkdown](#tips-for-rmarkdown)
  * [R Code](#r-code)
    + [Tidyverse style](#tidyverse-style)
    + [Issues using tensorflow and keras](#issues-using-tensorflow-and-keras)
- [Open tasks](#open-tasks)
  * [Structure and format](#structure-and-format)
  * [Chapters](#chapters)
  * [Exercises, Applications and Solutions](#exercises--applications-and-solutions)
  * [Code](#code)

# How to use this book

## Git

### Set-Up

- First you need to [install git](https://git-scm.com/downloads) in order to use it.
- To download the repository to your local machine do the following steps:
    1. Open your terminal on your computer (or use the one within RStudio)
    2. Check the directory you are in by entering `pwd` and use `ls` to check the directories and files therein. To navigate to your "base" directly, simply enter `cd`.
    3. Use `cd name.of.directory` to navigate to the folder where you want to download the repo to
    4. Use `git clone https://gitlab.ethz.ch/usys_lectures/esds_book` to downlaod the repo (enter your ETH login credentials when prompted)
    5. Create a new directory within *esds_book* called *data* via `mkdir data`
    6. Now, you still miss all the data that is needed to compile the book. There are two ways how to do this:
        - Downloading Data: Go to the share polybox and download the folder *4 Datasets*. Once, you've downloaded it, rename it to *data* and put it into the *esds_book* folder. **Important**: The data folder saved under *10 ESDS Book* does **not** hold all the data needed to build the book.
            - Via Polybox Client ([download here](https://polyboxdoc.ethz.ch/)): Navigate to your *esds_book* folder using the terminal and `cd`. In here, you can create a so-called "soft-links" to all the data in the folder of the polybox client. To do so, enter `ln -s ~/polybox/Shared/Data\ Science\ Lecture\ Planning\ -\ shared\ folder/4\ Datasets/* ./data/` (it could be that the path description has to be adjusted first).
    7. To install all packages that are needed in the book, open up the `index.Rmd` and run the code chunk in there.

### Workflow

- Never add any data sets to the git repository! Only add them to the polybox and create softlinks.
- Follow these steps for a nice collaborative workflow using git (alternatively to using the terminal, you can use the *Git* interace within RStudio)
    1. Open the .Rproj file within the esds_book directory
        1. If any new files have been added to the polybox, new softlinks have to be created. Thus, navigate to your *esds_book* using the terminal and enter `ln -s ~/polybox/Shared/Data\ Science\ Lecture\ Planning\ -\ shared\ folder/4\ Datasets/* ./data/`
    2. Within RStudio, navigate to the terminal and enter `git status` to check for updates of the repo
        1. If there are updates available do `git pull`
        2. If there is a so-called merge confilct, check which file is causing it. It is probably easiest if you get in contact with whoever was working on this file too to discuss what changes were made. Then, implement all these changes in one file and add it to the repo.
        3. If no more change pop up using `git status` - happy working!
    3. Once you are done working on your files (make sure they are knittable!) do again `git status` to check which files need to uploaded
    4. If you want to upload only changes to a certain file do `git add name.of.file`
    If you want to add all updated files at once, you can do `git add *`
    5. Next, you have to commit your change by entering `git commit -m "description.of.your.changes"`
    6. End the workflow with a `git push` and a `git status` to see if your changes have been commited

## Bookdown

### General

- The R package used to create this book is called `bookdown`. Have a loot at the respective [github](https://github.com/rstudio/bookdown), [website](https://bookdown.org/), [documentation](https://bookdown.org/yihui/bookdown/) to get a better grasp. Check out the [Get Started](https://bookdown.org/home/about/) page to get started.
- If you want to build the book locally on your computer, install `bookdown`, open up `esds_book.Rproj` and press `build book` under the *Build* tab in RStudio or enter `bookdown::render_book("index.Rmd", "bookdown::gitbook")` in your R console (see [this documentation](https://bookdown.org/yihui/bookdown/build-the-book.html)). Once the book is build, open the newly created index.html under *esds_book/_book.*
- As for now (early 2021), only a html version of the book is buildable. Making a PDF available requires significant additional work since the rendering is less straight-forward and ends up in messy formatting.
- All figures and graphics that are incorporated in the book are located in the *figures* folder on the repository.

### Structure

- Separation of tutorial and exercises even more strict. Avoid any duplication of explanations in the tutorial part.
- Theory must be accessible somehow. Is now in videos. Embed videos as youtube (see [here](https://bookdown.org/yihui/rmarkdown/learnr-videos.html)).
- Add exercises as separate sections into the chapters.
- Consider reducing contents, boiling it down to the essentials and avoid any duplication of explanations. Anything repetitive is to be relegated to exercises.
- Include all library load statements for each chapter at the top of the respective RMarkdown.
- Libraries should be explained with links to respective documentation pages.

### Tips for RMarkdown

- `bookdown` holds powerful tools like cross-referencing, citing, adding nice tables and figures (using `kable` and `knitr` packages), etc. Make sure to get familiar with these by reading the [documentation](https://bookdown.org/yihui/bookdown/)!
- Have a look at this [cheatsheet](https://github.com/rstudio/cheatsheets/raw/master/rmarkdown-2.0.pdf) to get to know RMarkdown (.Rmd) which the book is based on (e.g., formatting options, how to add links, how to knitt, how to use chunks, etc.)
- **Extensive Calculations:** If RMarkdowns contain code that takes long (anything above a few seconds) to run, avoid running respective chunk by setting `eval=FALSE` in the chunk options. This still displays the code in the knitted output - which we want. If outputs from compute-intensive code is required for knitting the RMarkdown file, try to come up with a better solution. For example, figures can be created first as PNG, figure files added to the repo and included in the RMarkdown as an image (`![](./dir_of_image/image.png)`).
- **Citation:** Links to online resources can be added using `[Linkname](https://...)` . To do proper citations, check out [this](https://bookdown.org/yihui/bookdown/citations.html) bookdown page - always make sure to add references to the *book.bib* file in *esds_folder*.
- **Cross-Referencing:** Chapters and figures are set-up to use for cross-referencing. How to do so, read [here](https://bookdown.org/yihui/bookdown/cross-references.html).

## R Code

### Tidyverse style

- All code should be structured following the [tidyverse style guide](https://style.tidyverse.org/).
- Please adopt tidyverse grammar wherever possible (for example, see below and chapter on data wrangling).

    ```
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

- Remember to use tidyverse functions wherever possible. In particular for the the functionalities described in chapter on data wrangling:
    - variable selection with `select()`
    - filtering/subsetting with `filter()`
    - variable definition with `mutate`
    - merging with the `_join()` family
    - dates with the *lubridate* package
    - `read_csv()` instead of `read.csv()`
    - `as_tibble()` instead of `as.data.frame()`
    - apply functions over elements of a list using `purrr::map()` family of functions instead of the `apply()` family.

### Issues using tensorflow and keras

- Later chapters on neural networks are based on using `tensorflow` and `keras`. However, installing them locally can be troublesome and executing the codes can take very long or even overwhelm your machine. Thus, the outputs for these chapters were generated on Renku and added as pictures or "fake outputs" in the book.
- If you want to install `tensorflow` and `keras` locally to try out the code follow this [documentation](https://tensorflow.rstudio.com/installation/)
    - The python environment that you want to set up should have the following packages and version installed.
        - Make sure to do this in the python environment that is used by R!
            - `conda activate /Users/name/Library/r-miniconda/envs/r-reticulat`
            - `conda install -y tensorflow=1.15.0 keras=2.3.1 h5py==2.10.0 pillow`.
    - Here are some useful stackoverflow posts for troubleshooting:
        - [https://stackoverflow.com/questions/63220597/python-in-r-error-could-not-find-a-python-environment-for-usr-bin-python](https://stackoverflow.com/questions/63220597/python-in-r-error-could-not-find-a-python-environment-for-usr-bin-python)
        - [https://stackoverflow.com/questions/56010733/error-installation-of-tensorflow-not-found](https://stackoverflow.com/questions/56010733/error-installation-of-tensorflow-not-found)

***

# Open tasks

*The list below holds inputs and ideas from the lecture evaluation (see pdf on polybox) and moodle feedbacks (final feedback, exercise forum, lecture forum). As for now (early 2021), the book is ready for usage but not proof-read. There is still need for proof-reading theory, improve wording, condense content, improve code style, etc. Have a look at the [shared excel](https://docs.google.com/spreadsheets/d/1H0F2ZLbEkt5nRRLzCFapwYDbXwXQozB7j-nAjd1eQYY/edit#gid=1623479706) to see what tasks are still open and for a rough estimate how many hours it will take to get a final first version of the book ready. Below is a collection of tasks for further improving the book.*

## Structure and format

- Recommendation for general structure of chapters
    - Introduction: Learning Objectives - Key Points of Lecture
    - Tutorial (depends on preference, currently first mentioned approach)

        Mixing theory and code: Topic 1 - Topic 2 - Topic ...
        Splitting theory and code: Theory - Code

    - Exercise: Overview - Task Description with Pseudocodes and Outputs to be generated
        - Solutions are not provided within the book directly but are stored on repository

- Referencing other resources is currently (early 2021) implemented as links and not as inline references (see [here](https://bookdown.org/yihui/bookdown/citations.html) for proper inline citing). However, all mentioned books are listed in the references chapter. Latter does not apply to linked papers, blogposts and youtube videos.
- PDF of book has been requested by students but due to knitting issues has not been finished yet.
- Coherent language is missing, current text is mixture of British and American English.
- Usage of bold and italic face (and other formats) is not coherent yet.
- Usage of inline referencing to figures is underused and could be improved.
- Naming of the files could be improved ([how to via git](https://docs.github.com/en/github/managing-files-in-a-repository/renaming-a-file-using-the-command-line)).
- The organisation of files in data directory is somewhat messy without naming convention or sub-folder structure. All data needed in book and exercise is gathered. Note that changing the structure will need respective changes in the RMarkdown files where files are loaded.

## Chapters

- Overall workload of course has been criticized, shortening and condensing content was suggested.
- Book and lecture content are not synchronized yet.
- Important topics that have not been added yet:
    - Include content on outlier detection, influential points
    - Residual analysis, autocorrelation: add example for what a memory effect could be.
    - How to use debugger in RStudio

- **Chapter Prerequisites** needs proper introduction, only holds bullet points from ETH VVZ.
- **Chapter 1**
    - Still holds explanations of how to use Jupyter Notebooks and git therein. This should be reformulated to an introduction to RStudio on Renku and using git in the terminal and GUI therein.
    - Implement introduction to how to use Renku. How to fork, to create an environment, navigate within environment.
    - Give introduction to environmental data (e.g. NASA, Copernicus, Google Earth Engine, Envidat, Pangaea, etc.). Where to find it, how to access it, what is open data, etc.
- **Chapter 2** holds too much new content. Holds too much new information and exercise takes a lot of time to solve. Maybe split into two chapters?
- **Chapter 5** is only revised regarding the tidyverse codestyle until the start of the case study. This tutorial is rather long and feedback suggested to skip this case study.
- **Chapter 7** and following:
    - Distinction of testing and validation data set is not coherent. Also, used figures might be confusing. E.g., in Chapter 7, the figure says "test" for the test-fold which we refer to as validation data. Alternative figure could be [this](https://miro.medium.com/max/632/1*FvKSbBPOOGdq0Zlwip3T2A.png) one from this [blog post](https://towardsdatascience.com/10-1-cross-validation-techniques-visualized-9013095fb68e).
    - Recommendations: Revisit content to never use "testing set/data" when referring to validation set. Or specifically call validation set "test fold". Part of "repeated CV" in Chapter 7 has been improved but needs proof-read.

## Exercises, Applications and Solutions

- ÏAll exercises are added to the end of each chapter. The respective solutions as RMarkdown files can be found on the repository.
    - There is no consistent style and formatting of the exercise defined. Exercises are only added as text with some provision of pseudo-code as for now. It would be nice to have a consistent style of structuring the task description (using headings, bold face, horizontal lines, etc.) and have the same done for the format of the solutions.
    - Most exercsie and solutions are in tidyverse style but not all yet (e.g. 04)
        - **Solution 04** is not yet in tidyverse but can easily be rewritten using the tutorial code.
        - **Solutions 07 and later** are not knitted with outputs due to keras/tensorflow issues. To get providable html, run via Renku or see files on polybox under *6 Exercises/solutions*.
- Regarding the lenght of exercises and applications: Generally, exercises were critized as being to vaguely written and without clear outcomes to be produced. Revisiting the wording and implementing coherent approach could be helpful here. Have a look at how [R for Data Science](https://r4ds.had.co.nz/data-visualisation.html#exercises-3) implements exercises, this could be done here as well (clear list of tasks, outputs to aim for, etc.)
- **Both applications** have been perceived as too complex to solve within deadline, either add more hints or extend deadline. However, content-wise student called it "challenging but interesting".
- **Chapter 05** is a collection of code examples to get a hang on different functionalities of R. There is no coherent structure and little eplanatory text included.

## Code

- Improvements on nicely structuring outputs to improve readbility.
- Most of the code is in tidyverse but there are still deviations with wrong spacing, naming, function usage, etc.
- To save space, printing of variables can be done by enclosing a code-line with brackets instead of printing it separately: `(x <- 1:10)` instead of `x <- 1:10` and `x` to print.