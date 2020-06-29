# drinkinggame

Next level drinking game and my first real Flutter application.

[Web version](https://www.drinktajm.web.app), looks a little bit worse than the iOS and Android versions.

## Running web version on Gitpod

`flutter run -d web-server --web-port=8080 --web-hostname=0.0.0.0`

## Deploying to Firebase Hosting

Install Firebase-CLI and login:

`npm install -g firebase-tools`

`firebase login --no-localhost`

`firebase init`

Then:

`flutter build web`

`firebase deploy`
