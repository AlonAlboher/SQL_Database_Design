**This repository contains:**

SQL database planning, design & build project
<br>
Int college Data Analysts class of 2024 SQL Project (Alon Alboher)
----------------------------------------------------------

In 2024 we created our first database using SQL, we started with the basics by designing 
two ERDs (using different approaches) to determine before hand what we will be creating, 
for example: what tables we might need? what will be their connections? etc. 
we used various syntax and commends such as join commands cte and more.

![alt text](https://static.wixstatic.com/media/8e190f_fae46e7a848e44a99ded2ab4b83773cb~mv2.png/v1/fill/w_1480,h_832,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/8e190f_fae46e7a848e44a99ded2ab4b83773cb~mv2.png)
![alt text](https://static.wixstatic.com/media/8e190f_104633394eff488aa6671ca72fa4debc~mv2.png/v1/fill/w_1480,h_830,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/8e190f_104633394eff488aa6671ca72fa4debc~mv2.png)

We've experienced a few challenges along the way such as:
---------------------------------------------------------

"The case of the living plan":
How do you create a database? You plan, design, built and structure the data.
At least that's what we thought, but sooner rather than later we found that while structuring our data we encounter challenges that force us to change the plan and the initial design.
Eventually we found we needed to change plans, and shift designs to create a better database,
in a certain manner we found that our data was "living"/"growing" and so we need to adapt and change to support it and get the best of it.

"The case of the multiplying tables":
At first we planned to create several tables as columns of other tables, but in order to support our changing data and keep track of the data that was changed we needed to switch the design from using columns for that data to actually creating it under a different table (example: Membership & subscription)

"The case of the harsh constraint":
When defining our constraints we tried using the known samples of data types, but in some cases that proved harder than we thought. for instance, making an email with a .com ending might refuse to accept Emails not ending with .com.
In the case of phone numbers we found that there are endless possibilities, so we decided to focus on the Israeli market and thus allowing only 2 formats (Landline + Cellular)

Example images from our SQL code:
---------------------------------
![alt text](https://static.wixstatic.com/media/8e190f_93c733852bb740aa8e23c30bdcc98c74~mv2.jpg/v1/fill/w_1480,h_1710,al_c,q_90,usm_0.66_1.00_0.01,enc_auto/8e190f_93c733852bb740aa8e23c30bdcc98c74~mv2.jpg)
![alt text](https://static.wixstatic.com/media/8e190f_1d3260d4fe2f435b92a5c0c1efbc6997~mv2.png/v1/fill/w_1480,h_1438,al_c,q_95,usm_0.66_1.00_0.01,enc_auto/8e190f_1d3260d4fe2f435b92a5c0c1efbc6997~mv2.png)
![alt text](https://static.wixstatic.com/media/8e190f_1a4edd67bbca4d5ab161488e2c6d87ef~mv2.png/v1/fill/w_1480,h_1612,al_c,q_95,usm_0.66_1.00_0.01,enc_auto/8e190f_1a4edd67bbca4d5ab161488e2c6d87ef~mv2.png)
