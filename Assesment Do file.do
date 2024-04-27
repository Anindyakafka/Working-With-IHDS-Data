use "C:\Users\anind\Downloads\Individual.dta" // Load the Individual dataset

unique IDHH SURVEY // Identify unique household IDs and survey waves

unique IDHH IDPERSON SURVEY // Identify unique household IDs, person IDs, and survey waves

merge m:1 IDHH SURVEY using "C:\Users\anind\Downloads\Household.dta", generate(_merge_hh) // Merge Household dataset with Individual dataset based on household ID and survey wave

unique IDHH SURVEY // Identify unique household IDs and survey waves after merging

unique IDHH IDPERSON SURVEY // Identify unique household IDs, person IDs, and survey waves after merging

winsor2 WSEARNHOURLY, suffix(_outlier) cuts(1 99) trim // Winsorize the hourly wage variable (WSEARNHOURLY) at the 1st and 99th percentiles, creating a new variable (WSEARNHOURLY_outlier) and trimming

sum WSEARNHOURLY WSEARNHOURLY_outlier // Export the original and winsorized hourly wage variables to a Word document using the asdoc command

codebook WSEARNHOURLY // Display the codebook for the hourly wage variable

gen logwage = log(WSEARNHOURLY) // Create a new variable (logwage) by taking the natural logarithm of the hourly wage variable

codebook logwage // Display the codebook for the logwage variable

// Another way to standardize the hourly wage variable

gen z_wage = (WSEARNHOURLY - 27.438)/35.0201 // Create a new variable (z_wage) by standardizing the hourly wage variable using the mean (27.438) and standard deviation (35.0201)

codebook z_wage // Display the codebook for the z_wage variable

codebook WSEARNHOURLY RO3 // Display the codebook for the hourly wage variable and the RO3 variable

gen consumption = CO1X + CO2X + CO3X + CO4X + CO5X + CO7X // Generating variable called consumption that measures the amount spent on wheat, rice, sugar, meat, kerosene, and other cereals

histogram logwage, normal kdensity by(RO3) // Create a histogram of the log hourly wage variable with a normal curve and kernel density estimate, grouped by the RO3(sex) variable