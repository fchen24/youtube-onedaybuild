# youtube-onedaybuild
One day build for YouTube App with Chris
Basic API calling, JSON parsing, project files hierarchy, Delegation pattern, github to store the code and bitrise to auto build the code, tableview, webkit, segue and more.

[-> *CodeWithChris: ONE-DAY Build - YouTube Video App* <-](https://www.youtube.com/playlist?list=PLMRqhzcHGw1aLoz4pM_Mg2TewmJcMg9ua)

---
### API Calling
- Create a URL object

`let url = URL(string: urlSring)`

- Create a URL request

...

- Specify the header

...

- Specify the body

...

- Set the request type (http methods, e.g. GET or POST)

...

- Get a URLSession object

`let session = URLSession.shared`

- Get a data task form the URLSession object

`let dataTask = session.dataTask(with: url)`

- Kick off the task

`dataTask.resume()`

---
### JSON parsing
- Parsing the data into the object

`let decoder = JSONDecoder()`

- Decoding from URL response data

`let response = try decoder.decode(Response.self, from: data)`

- CodingKeys (emun type)

Using enumeration.

- Decoding by coding keys 

`let container = try decoder.container(keyedBy: CodingKeys.self)`
`self.items = try container.decode([Video].self, forKey: .items)`
`let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)`

---
### Delegation
「Delegation is a design pattern that enables a class or structure to hand off (or delegate) some of its responsibilities to an instance of another type. This design pattern is implemented by defining a protocol that encapsulates the delegated responsibilities, such that a conforming type (known as a delegate) is guaranteed to provide the functionality that has been delegated. Delegation can be used to respond to a particular action, or to retrieve data from an external source without needing to know the underlying type of that source.」 - From Apple manual "The Swift Programming Language".

---
### Project files hierarchy
Through Model-View-Controller (MVC) design patter, we need to manage our source code in a good manner:
1. Models
2. Views
3. View Controllers
4. Storyboards
5. Helpers
6. ...
---
### More suggestions!!
If one functionality uses more than once, it is a chance to think about encapsulating it into a single file. That is a good coding manner, you will gain more if you should change it somewhile in the future!
