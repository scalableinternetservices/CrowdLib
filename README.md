# CrowdLib

**CrowdLib** is a crowdsourced, location-based book-lending platform. A one stop for reading enthusiasts to share, rate, comment, and review books. This would eventually lead to live communities, bringing people with similar interests together.

Users of **CrowdLib** can get a feed of book-related news based on their locality. This includes people wanting to lend books, community posts, etc. If one decides to borrow a book from someone, the transaction is made simple by allowing us to directly show both parties how trustworthy they are and which condition the books are in. **Crowdlib** is genre-driven, in that users get more news depending on the genres they select as their favorites, with the possibility of adding or removing genres as time goes. One can also compare tastes with other people and use this to filter their taste and find new books that people around are reading about.

## API Documentation ##

The actual API documentation is growing and changing with each new commit. All API calls are in the **/api/v1/** namespace:

### Users
  - GET /users/count - returns the current count of registered users
  - GET /users/by/id/:id - returns the basic information about the user with ID :id
  - GET /users/by/username/:name - returns the basic information about the user with username :name
  - DELETE /usrs/by/id/:id/auth/:token - deletes the user with ID id and authenticated by :token

### Locations
  - GET /locations/around/:lat,:lng - returns the locations around a point (:lat, :lng) in a predefined radius
  - GET /locations/around/:lat,:lng/within/:radius - returns the locations around a point (:lat, :lng) within a certain :radius

## Developers

### Ankita Singh
![Ankita Singh](https://www.cs.ucsb.edu/sites/cs.ucsb.edu/files/styles/portrait-full/public/images/graduate/singh_ankita.jpg?itok=wPKKK1pO&c=dfb8706d4f97d3cc93104e5e714e3d37)

### Pritha Narayanappa
![Pritha Narayanappa](https://www.cs.ucsb.edu/sites/cs.ucsb.edu/files/styles/portrait-full/public/images/graduate/dn_pritha.jpg?itok=-1gTb2gp&c=c4ef7e4d001393f3c454c360df69a6e7)

### Nimisha Srinivasa
![Nimisha Srinivasa](https://www.cs.ucsb.edu/sites/cs.ucsb.edu/files/styles/portrait-full/public/images/graduate/srinivasa_nimisha.jpg?itok=iBqjmdsU&c=a842d952e919e4d342b2796cd76eb97d)

### Hemanth Aditya
![Hemanth Aditya](https://www.cs.ucsb.edu/sites/cs.ucsb.edu/files/styles/portrait-full/public/images/graduate/challoju_hemanth_0.jpg?itok=TnePjsMB&c=07180c61835c8bd1d27b5e12232b08b9)

### Gavrilov Miroslav
![Gavrilov Miroslav](https://www.cs.ucsb.edu/sites/cs.ucsb.edu/files/styles/portrait-full/public/images/graduate/gavrilov_miroslav.jpg?itok=gIgg0o2d&c=9754cc46a1cc5ead818fe643ab52da58)

## API Documentation

**Soon to come**

## Trackers

**[PivotalTracker](https://www.pivotaltracker.com/n/projects/1446066)**
