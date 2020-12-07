# iOS NYTimesSampleApp

Barebones Swift iOS app showcasing basic ParticleSetup / Particle-SDK cocoapods usage / getting started.

Built using XCode 11.5


## UI 

![Simulator Screen Shot - iPhone 11 Pro Max - 2020-12-06 at 21 23 02](https://user-images.githubusercontent.com/35212533/101287359-3e89a000-3809-11eb-98d6-fcd3953f7cfa.png)

![Simulator Screen Shot - iPhone 11 Pro Max - 2020-12-06 at 21 22 56](https://user-images.githubusercontent.com/35212533/101287363-45b0ae00-3809-11eb-87c9-91f97b4eebc8.png)

### How to run the example?

1. clone this repo
2. open the terminal
2. navigate to project folder
3. run `pod install`

#### How to run Sonarqube & Test using Fastlane?

Install fastlane using gem install fastlane

1. navigate to project folder
2. open sonar-project.properties
3. increase sonar.projectVersion
4. open the terminal
5. run fastlane metrics

##### Sonarqube

This is also another tool integrated for check project code health reports.

Install and setup your SonaQube server and other dependency for sonarQube integration with the help of https://github.com/Backelite/sonar-swift or another source.
Project already contains  sonar-project.properties in project root folder.
open sonar-project.properties and increase sonar.projectVersion
Once your server up, goto project directory and run the sonar-scanner command from terminal.
After successful scan -
 open browser and hit http://localhost:9000/,
You will see the project analyses, Tap on project analyses it will show detail reports

<img width="1518" alt="Screen Shot 2020-12-06 at 9 07 40 PM" src="https://user-images.githubusercontent.com/35212533/101287196-40069880-3808-11eb-8640-c6bf48d400a6.png">

###### Unit Test

Total TestCase: 9
Passed : 9
Failed: 0
TestCase Code Coverage: 65.0%

<img width="2048" alt="Screen Shot 2020-12-07 at 10 05 59 PM" src="https://user-images.githubusercontent.com/35212533/101387870-83303c80-38d8-11eb-93d1-54399adc8d28.png">

<img width="2046" alt="Screen Shot 2020-12-07 at 10 05 50 PM" src="https://user-images.githubusercontent.com/35212533/101387887-8c210e00-38d8-11eb-938e-9d8c97e70d40.png">

Thank you!
