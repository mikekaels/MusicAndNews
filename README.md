# Music And News

![This is an image](https://i.ibb.co/6vCG4RX/Group-2.png)

## Features
- Play Music
- News List

## Project

### Clean Architecture VIPER
[View-Interactor-Presenter-Entity-Routing (VIPER)](https://www.objc.io/issues/13-architecture/viper/)
I use the exotic architecture that might be worth looking into in larger projects.
```
├─ Core/Networking
├─ Extensions
├─ Utils
├─ Modules
    ├─ Module
    ├─ Module
        ├─ Presenter
        ├─ Router
        ├─ Models
        ├─ Interactor
        ├─ Protocol
        ├─ VC
├─ AppDelegate
```

### Programatically UI
I'm more confident to use programatically to avoid error or conflict on the XIB or Storyboard
```
private let lblDesc: UILabel = UILabel()
        .configure { v in
            v.font = UIFont.boldSystemFont(ofSize: 20)
            v.textColor = .white
            v.text = "Description"
        }
        
view.addSubview(lblDesc)
```

### Auto Layout
To configure auto layout I use NSLayoutConstraint.
```
  imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
  imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
  imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
  imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
```

### Constants
```
public class Color {
    static let background = UIColor.init("#1A202C");
    static let navigation = UIColor.init("#161B22");
    static let foreground = UIColor.init("#FFFFFF");
}
```

### Networking
Using URLSession to manage the request

## Getting Started
### 1. Clone this project
You can clone the project by Http or Ssh on your terminal
- HTTP ``` git clone https://github.com/mikekaels/MusicAndNews.git ```
- SSH ``` git clone git@github.com:mikekaels/MusicAndNews.git ```
- Or [download the project](https://github.com/mikekaels/MusicAndNews/archive/refs/heads/main.zip)
### 2. Open the .xcodeproj file
![This is an image](https://i.ibb.co/84cxRCL/Screen-Shot-2022-02-15-at-04-01-34.png)
open the file
### 3. Run
![This is an image](https://i.ibb.co/3sMQvVk/Screen-Shot-2022-02-15-at-03-58-20.png)
Select the simulator or device
and Run the project!
### 4. Done


## Dependency
- No Dependency
