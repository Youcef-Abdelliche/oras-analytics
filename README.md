# Oras A - The analytics platform -
## Note: you can find the XD file the ui design of the app here [At google drive](https://drive.google.com/file/d/1klUl9j2Z9qBakk6ifZKbVwJeVuXXZ13P/view) or [use adobe XD live preview](https://xd.adobe.com/view/4d64a659-e97f-40e4-aea4-fa97c109cb3a-1837/?fullscreen)
Our solution is to make a platform to visualize the data gathered from Oras devices, to help the users make better decisions and compete with their neighbors by reducing the usage of water and the power used to heat it.
### The “Oras A” mobile:
It’s a mobile app that targets mainly two user types, which are the apartment inhabitant and the building owner, the app provides apartment inhabitants with: 

- A home screen that shows the overall water/power consumption to the user filtered by day, week or month.
- The user can access his detailed consumption information provided through a screen that shows what each Oras device consumes, filtered by day, week and month.
- A scoreboard that shows the user how many points he has gained in a month by following rules that were explained in a dedicated screen.
- To make the experience more enjoyable, the app provides special badges “water eco”, “super-water eco" to a user when he completes a streak of water/power saving.

The mobile app also provides building owners with:

- An overall consumption information about the whole building, filtered by day, week or month.
- It also provides the user with a detailed consumption info that even reaches each device in selected apartments, the info can be also filtered by day, week or month.
- The app helps the building owners to optimise the heating process, by providing them with a customized bar chart that show the active hours of hot water usage per day.


### The “Oras A” for wear:
- In order to keep the user more often updated by his consumption habits. We have built a wear Os application that provides the overall water/power consumption at a glance.
- The app also provides the user with basic information about his scoreboard performance and badges, to give him an idea how he stacks up against his neighbors.

### Our scoring system:
1.	first sign in: 100 Points
3.	if flowtime of Optima faucet is less than 20s then:-1 if more is +5
4.	if the day consumption of the appartement average of a device is less than the previous day : +3 if more -1 
4.	if the day consumption of the appartement average of a device is less than the building average : +6 if more -1 
5.	if the total day consumption of the appartement average is less than the previous day : +10 if more -5
5.	if the total day consumption of the appartement average is less than the building averag : +20 if more -2
8.	if you keep the consumption less than the average or equal to it for a week: +100 , for a month +1000
8.	if you keep the consumption less than the building average or equal to it for a week: +200 , for a month +2000
9.	if the hot water flow time of Hydractiva shower is more than 10 minutes then : flowtime=10+n min then you get -n(1+n)/2 else: +10
10.	if the hot water flow time of Optima faucet is more than 1 minutes then : flowtime=1+n min then you get -n(1+n)/2 else: +1
11.	if the hot water flow time of Kitchen optima faucet is more than 5 minutes then : flowtime=5+n min then you get: -n(1+n)/2 else: +5
12.	if the hot water flow time of Washing machine is more than 50 minutes then : flowtime=30+N,N=10n min then you get: -n(1+n)/2 else:+30
13.	if the hot water flow time of Dishwasher is more than 60 minutes then : flowtime=30+N,N=10n min then you get: -n(1+n)/2 else: +60
14.	if you dont get a hot water penality for: a week +500, for a month +5000
