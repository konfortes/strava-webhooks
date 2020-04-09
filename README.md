# strava-webhooks

Strava webhooks handler

## Omniauth

This app uses [omniauth](https://github.com/omniauth/omniauth).  
Authorization initiated by browsing to `/users/auth/strava`
This endpoint will redirect to `https://www.strava.com/oauth/authorize` with client_id, redirect_uri (`/users/auth/strava/callback`) and some other parameters.  
after authorizing with Strava, you will be redirected back to the specified `redirect_uri` and a user will be created (or signed in).  
Each user should have `authorization_token` that will be used to call Strava api on behalf of the user.
  
make sure `STRAVA_CLIENT_ID` and `STRAVA_API_KEY` are being set in env (can use .env)  
If browsed from browser, a Devise auth cookie will be sent back.

## Webhooks subscription

```bash
curl -X POST https://www.strava.com/api/v3/push_subscriptions \
      -F client_id=5 \
      -F client_secret=7b2946535949ae70f015d696d8ac602830ece412 \
      -F 'callback_url=https://stravooks.herokuapp.com/webhooks' \
      -F 'verify_token=STRAVA'
```