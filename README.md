Vancouver Fountain Finder
===================
Find a drinking fountain in Vancouver, BC  
Data (`drinkingFountains.csv`) provided by the [City of Vancouver](http://data.vancouver.ca/datacatalogue/drinkingFountains.htm) ([terms](http://vancouver.ca/your-government/terms-of-use.aspx))

The database was imported from the csv file. The names of the fountains were truncated so that they are more user friendly.  

Usage:
------
```bash
git clone git@github.com:baopham/vancouver-fountains.git  
mysql -u root -e "create database fountains"  
mysql -u root fountains < fountains.sql  
npm install  
node app.js  
```

Requirements:
-------------
* [Express](https://github.com/visionmedia/express)
* [Google Maps API for Node.js](https://github.com/moshen/node-googlemaps)
* [Jade](http://jade-lang.com/)
* [Node.js driver for MySQL](https://github.com/felixge/node-mysql)

Author:
-------
Bao Pham
