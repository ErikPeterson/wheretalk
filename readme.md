#WhereTalk

WhereTalk is a tool that seeks to remove a hurdle for patients seeking mental health care, and doctors hoping to attract new patients suited for their pratices. WhereTalk lets a patient easily find nearby doctors that suit their needs through a simple set of scopes. 

When a user visits the site, they are presented with a map. They can enter an address, or use geolocation to pin themselves on the map and find practictioners within their distance limit. They can also select a list of specialties or areas of treatment they feel match their symptoms, and narrow their search to doctors who have listed those specialties on their profile.

##Features:

###Registration:

WhereTalk uses Devise for authentication. Doctors sign up with their email, name, number, address, title, and degree. The entered address is normalized through Geocoder, and translated into lat/lng coordinates for use in mapping. 

Phone numbers are also normalized and formatted using Phony.

###Mapping:

WhereTalk leverages Gmaps for Rails for asset building and basic mapping functionality, and builds on top of that with its own MapGenerator.js.

MapGenerator takes an element and a configuration hash, and instantiates a stateful object that can make requests for new markers and information through Ajax, rerender itself, and switch between several different rendering methods and data sources.

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


##Todo:

WhereTalk should incorporate schedules to be more useful for doctors and patients. Doctors should have an abstract schedule, and patients should be able to indicate preferences for appointment days or times for recurring treatment.

WhereTalk should incorporate a system to attach accepted payment methods to doctors, and further scope user requests by desitred payment method.

Gmaps for rails provides a good wrapper for the Google Maps API, but it is too heavy for the use case here. MapGenerator should be refactored to directly access the low level GM api.