# project-info201

## **Domain of Interest**
- Why are you interested in this field/domain?
For the project, our area of focus is centered on highlighting the disparities in access to voting within marginalized communities. Specifically, our target groups are women and BIPOC people and any intersectionality between the two demographics. We are interested in this as we all feel that issues such as voter suppression and voter intimidation are still increasingly pervasive systemic issues that have led to a lack in voter engagement and turnout within these groups. There are a multitude of existing and new barriers, such as delay with ballot drop-offs via US Postal Service, continual cut of mail ballot drop-off sites, lack of online registration, personal identification requirements and more. With that, our group aims to dive more in-depth into this study to observe where these practices are still prevalent, analyze the number of people it still affects, as well as understand the effects of it on today’s voting processes.  
- What other examples of data driven projects have you found related to this domain (share **at least 3**)?
Related to this domain, some examples of data driven projects we have are the Block the Vote campaign that highlights on the different aspects of voter suppression, looking at data from the existence of voter ID laws and how they disproportionately affect voter turnout rates in demographics of color and lower class. Another project we found relating to this domain was NBER’s study on racial disparities in voting wait times where they analyzed the smartphone data of voters to show that people of color had longer wait times, which discourages voter engagement. Lastly, we found a data-driven project that focused on how voter turnout between men and women also differ, and shows us that intersectionality has an even greater impact on disparities in democratic engagement.
- What data-driven questions do you hope to answer about this domain (share **at least 3**?
With our domain, we would like to first discover the impact of different laws on voting disparities in marginal communities to see which laws are most affecting voter turnout. We also hope to then analyze the voting disparities between men and women to answer whether or not intersectionality between race and gender affects voting engagement as well. Through analyzing our data, we would also like to see whether or not there is actually a direct correlation between laws and government occurrences, such as ballot box waiting times, and voter turnout, and to see whether or not there is a system that does not disproportionately discourage voter participation in marginalized communities.

## **Finding Data**

Data Source (1)
- Where did you download the data (e.g., a web URL)?
Data was downloaded The United States Census website: https://www.census.gov/data/tables/time-series/demo/voting-and-registration/p20-580.html (Table 4b)
- How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?
This data was collected by a national survey that is sent out to every US resident every 2 years. This data takes into account sex, race, and Hispanic-origin for every US state in the 2016 election.
- How many observations (rows) are in your data?
There are 571 rows in the data -- 11 rows for each state.
- How many features (columns) are in the data?
There are 14 columns in the data
- What questions (from above) can be answered using the data in this dataset?
From the dataset we could answer questions based on race and gender from each state. We could also look at voting laws in each state and discover the correlation it has with voter turnout.

Data Source (2)
- Where did you download the data (e.g., a web URL)?
Data downloaded from from the research paper from NBER’s study in November 2019: https://www.nber.org/system/files/working_papers/w26487/w26487.pdf.
- How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?
This data was collected by a research team at the National Bureau of Economic Research by pinging the phones of voters in different polling areas at a certain radius from the voting booth. In order to make sure the radius to be measured is the optimal size, the team took a data-driven approach and examine the unique individuals who show up near a polling place on Election Day relative to the week before and the week after the election, to better eliminate false positives in their data collection. After deciding on a radius of 60 meters, the team tracks the phones in the radius and times how long their vote times are before the individuals go to the polling station and vote. With the phone time data, the team then analyzes the demographics of each polling area to see the disparities in these voting times and how they correlate to the race of each neighborhood.
- How many observations (rows) are in your data?
There are 410 observations (rows) in this data that shows the Congressional District-Level Measures of Wait Time and Disparities in the country.
- How many features (columns) are in the data?
There are 8 features (columns) in the data to show the data collected in each of these congressional districts.
- What questions (from above) can be answered using the data in this dataset?
From the data in this dataset, it can answer the question of what the impact of different laws/government systems, specifically polling stations and wait times at them, is on voting disparities in marginal communities. This will also help to identify whether there is clear evidence to show the disproportionate targeting of communities of color.

Data Source (3)
- Where did you download the data (e.g., a web URL)?
Data was obtained from: https://www.annualreviews.org/doi/full/10.1146/annurev-polisci-051215-022822.
- How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?
There are many different data sets and charts within this one source; however, all of the data are classified based on information and coding provided by the National Conference of State Legislatures (NCSL), where they consolidated state policies. All of the data presented showcases which states still utilize voter suppression methods and doesn’t, such as requirement for documentation and strict photo identification laws.
- How many observations (rows) are in your data?
  - Table #1: _State voter identification laws in place for the 2016 elections_
    - 1 observation (row) that shows the list of states
  - Table #2: _State adoption of strict photo ID laws_
    - 15 observations (rows) that shows list of states
- How many features (columns) are in the data?
  - Table #1: _State voter identification laws in place for the 2016 election_
    - 5 features (columns) that shows the type of requirements that states adopted
  - Table #2: _State adoption of strict photo ID laws_
      - 4 features (columns) that shows the year voting policies were adopted for specific states, whether or not policies were enacted in the 2016 presidential election, as well as which party(s) is in control of the state
- What questions (from above) can be answered using the data in this dataset?
Data from this dataset can help us observe the correlation between voter suppression methods, specifically strict documentation and photo identifications criteria required by certain states, and disproportionately low voter turnout amongst BIPOC demographics.
