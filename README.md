<img src="https://user-images.githubusercontent.com/63591976/211210841-c3ed4579-831e-4969-a0eb-1e826a07d988.png" alt="drawing" width="65"/>

# Baluchon
Travel partner App 


## Description : 


This application was developed as part of the Openclassrooms iOS development training.
The user interface was entirely programmatically created using CollectionView and TableViews.


This is a three-page application :


- Conversion : on this page the user can get the exchange rate between the dollar and euros
- Translation : on this page you can translate sentences from French to English
- Weather : on this page the user can compare the weather between NewYork and his current location 


To navigate between those pages, I will use a tab bar, with each tab corresponding to one of the three previously described pages.
When making network calls within the application, if an error occurs, I will present it in the form of a pop-up using UIAlertController class.


Other requirments :


- Conforms to MVC architecture
- Supports last three iOS version
- The application is responsive and supports all iPhone sizes
- Network calls using API
- Unit test (Logic & Network)
- Testing Network services using Mocking
- Addapts to iPhone theme (system light and dark mode)
- Communicates with Delegates


### Conversion :

API : Fixer.io

In the exchange rate page, the user can enter an amount in dollars or euros currency and see the result.

A switch button in the Navigation bar allows to switch between the currencies.


### Weather :

API : Open weather

In the weather page, the user can compares the weather between Paris and New York.

A switch button in the Navigation bar allows to refresh the page to update the weather.


### Translation :

API : Google translate

In the conversion page, the user can enter any text in french or english and see translate it.

A switch button in the Navigation bar allows to switch between the languages keeping the result in memory.




