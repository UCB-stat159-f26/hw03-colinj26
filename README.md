# Introduction 

**Title:** Tennis Player Age Functions 

**Name:** Colin Johnston

**Background:** The aim of this package is to introduce two public functions, get_player_data() and make_age_plot(), with several private helper functions, to retrieve a data frame of career matches from any professional tennis player, clean the data frame, and produce a plot similar to the Serena Williams plot from Homework 2. The final plot will display a given player's age on the x-axis and the age difference with an opponent on the y-axis for a given game. Each game is marked with a point on a scatter plot and colored blue for a win and purple for a loss. With the get_player_data() function, there are 4 helper functions that shorten the overall code of the public function to a few lines. For the make_age_plot() function, there are no helper functions, as the code focuses on a short ggplot object construction for a given player. These functions, when used together, will work for any player with career matches and background information (a player's age) that is found at tennisabstract.com. 

**Two Public Functions:**

-> **get_player_data()** - Retrieves player data for a selected player 

-> **make_age_plot()** - Makes a ggplot illustrating age and match statistics

**Goals:** There are a couple of key considerations that must be observed in order to ensure that the functions work properly:
1. Ensure that get_player_data() works on male data, which has opponent ages already stored in the career data
2. Ensure that get_player_data() works on female data, which does not have opponent ages already stored in the career data
3. Ensure that get_player_data() returns an error message if the name entered is not a professional tennis player

-----------------------------
# Data Sources 

(1) Career Files 
-> All career files for players are found through a function that appends a player's name to the url:
https://www.tennisabstract.com/jsmatches/playernameCareer.js

(2) Main (Age) Files
-> All main files with player information, including birthdays, are found through a function that appends a player's name to the url:
https://www.tennisabstract.com/jsmatches/playername.js

-----------------------------
# Package Structure 
**Visual Diagram** 


```
hw03-colinj26/
└── man/
	├── get_player_data.Rd
	├── make_age_plot.Rd
└── R/
	├── get_player_data.r
	├── helper_functions.r
	├── make_age_plot.r
└── tests/
	└── testthat/
		└── fixtures/
			├── FemalePlayerCareer.js
			├── MainPlayer.js
			├── MalePlayerCareer.js
		├── test-tennis.R
├── .gitignore
├── .Rbuildignore
├── aidocumentation.txt
├── DESCRIPTION 
├── LICENSE
├── LICENSE.md
├── NAMESPACE
├── README.md
├── tennispackage.Rproj
```

**Description:** 

(1) The code for all public functions is found under the R folder as get_player_data.r and make_age_plot.r 

(2) roxygen comments are documented in the man folder 

(3) Local files for testing are found in tests/testthat/fixtures

(4) All relevant tests are found in tests/testthat/testthat.R

(5) Other relevant metadata, documentation, and licensing can be found in the DESCRIPTION, LICENSE, LICENSE.md, NAMESPACE, and README.md files 

-----------------------------
# Instructions 

(1) **Installing the Package:** Use the following command in the r console to download the package: 
> devtools::install_github("UCB-stat159-f26/hw03-colinj26")

(2) **Load in the library:** Once the package has been downloaded, load it in as a library. Use the following command in the r console to do so: 
> library(tennispackage)

(3) **Use both functions:** Now that the functions are sufficiently loaded in, both functions can be utilized on sample players. These functions can be utilized in the r console, an r code chunk, or an r file. Those public functions are as follows: 

- **get_player_data()**
-> loads in player data as an r dataframe object from the web 

- **make_age_plot()**
-> creates a ggplot similar to the Serena Williams plot of matches played colored by wins and losses with a player's age on the x-axis and the age difference with their opponent on the y-axis

-----------------------------
# Tests 

**Description:** All tests are contained within tests/testthat/test-tennis.R. All local sample .js files are stored inside of tests/testthat/fixtures. The tests ran are strictly on the locally stored data files. as such, the helper function, which is the last helper function used in the get_player_data() function, make_ages_df(), is employed here as it uses .js files. For the plot tests, the public make_age_plot() function is tested here. All tests pass when assessed.

**Running Tests:** If the repository is installed to a local environment, all tests can be run using:
> devtools::test()

-----------------------------
# Personal Reflections

(1) **Player Names:** It is difficult to make code that can work to extract the capitalized version of player names. This is especially true when players can have hyphenated or two-word last names. As such, careful attention to detail was placed on the initial portion of the get_player_data() function when it comes to this naming. 

(2) **Helper Functions:** Helper functions aid significantly in deconstructing a complex function into a much more digestible one for an individual making a package. In particular, if portions of the function fail, it is easy to detect which helper function needs more careful attention. 

**Overall Thoughts:** The construction of this package was an extremely valuable endeavor that illuminated how important it is to create packages that are transparent and well constructed. In particular, having very clear function files that execute very specific tasks seemingly involves numerous operations and helper functions to ensure that everything runs smoothly. I particularly learned that the way in which functions can be envoloped or used as a dependency for one another in a single larger function is pivotal for package construction. This is especially valuable for functions like get_player_data(). I also learned that any excess files that are not necessarily used in a certain package, such as markdown files or an .Rproj file must be placed in the .Rbuildignore file to ensure that there are no errors in package downloading. Finally, it was valuable to see how tests can be used to ensure that functions work properly. Examining the plethora of "expect" commands demonstrates the various ways in which functions can be tested. 





	




