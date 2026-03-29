# space_x_launches

Flutter application that displays SpaceX rocket launches.

## Getting Started

## Features

- View list of SpaceX rockets via carousel slider
- Browse launches for selected rocket
- Launch details (date, mission, location)
- Open Wikipedia page for each launch
- Smooth UI with loading & error states


## Tech Stack

- **Flutter**
- **Riverpod** (state management)
- **Dio** (networking)
- **flutter_dotenv** (environment variables)
- **intl** (date formatting)
- **google_fonts** (app theme)
- **url_launcher** (open external links)

## Architecture
```
lib/
├── features/
│ └── home/
│   ├── view/
│   └── widgets/
├── repositories/
│ ├── rocket_launches/
│ |  └── model/
│ └── space_rocket/
│     └── model/
├── providers/
└── theme/
```

