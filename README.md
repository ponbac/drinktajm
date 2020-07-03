# drinkinggame

Next level drinking game

## Copying questions to Firebase

`cp assets/questions.json build/web/questions.html`

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
