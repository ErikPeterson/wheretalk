#WhereTalk

WhereTalk is a tool that seeks to remove a hurdle for patients seeking mental health care, and doctors hoping to attract new patients suited for their pratices. WhereTalk lets a patient easily find nearby doctors that suit their needs through a simple set of scopes. 

When a user visits the site, they are presented with a map. They can enter an address, or use geolocation to pin themselves on the map and find practictioners within their distance limit. The search can be further narrowed by selecting a preferred payment method, and by selecting desired specialities/areas of treatment. Once doctors have been found, their available appointment times are listed in their profile, and on their pin in the map.

A working demo of WhereTalk is available at http://wheretalk.herokuapp.com.

##Features:

###Registration:

WhereTalk uses Devise for authentication. Doctors sign up with their email, name, number, address, title, and degree. The entered address is normalized through Geocoder, and translated into lat/lng coordinates for use in mapping. 

Phone numbers are also normalized and formatted using Phony.

###Mapping:

WhereTalk leverages Gmaps for Rails for asset building and basic mapping functionality, and builds on top of that with its own MapGenerator.js.

MapGenerator takes an element and a configuration hash, and instantiates a stateful object that can make requests for new markers and information through Ajax, rerender itself, and switch between different rendering modes and data sources.

###Database

WhereTalk sits on a PostgreSQL database which manages users and other data. No private data is stored, helping to minimize security risks.

###UI

WhereTalk is fully responsive for ease of use on location-enabled mobile devices. Its finding mechanism and layout are designed to make a difficult task (finding nearby doctors in the right field) as simple as possible.


##Development

WhereTalk is developed with a behavior driven test suite. It uses phantomjs to do headless integration tests, and fakes geolocation through phatomjs's webkit api.

##Data

Development required the presence of many registered doctors in the database with which to test functionality and useability for patients. Addresses needed to be real to function with geolocation, but names, numbers, and photographs did not.

In order to facilitate development, a list of known NYC street addresses was pulled from various online sources. This list was paired with the Faker library to generate profiles for about a dozen doctors—enough to give meaningful results in trial runs of the app.

A note on photos: photos are a really great way to humanize service providers and professionals to potential customers. In order to demonstrate the effect of photos without distracting from the development of the app itself, only 3 sample stock photos are used throughout the app. They are randomly assigned to doctors at seed time.

In order to circumvent issues with the Google Maps API rate limit in development, the development database was generated once and dumped to SQL. This prevents the need to re-geocode each user by address when seeding the development database.


##Todo:

Gmaps for rails provides a good wrapper for the Google Maps API, but it is too heavy for the use case here. MapGenerator should be refactored to directly access the low level GM api.