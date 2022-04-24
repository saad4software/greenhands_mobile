# greenhands_mobile
An open source, community service project to help people in need on 'need to know' basis


## Main Idea
This project divides users into three categories: Takers, Givers and Organizers.
therefore there are three paths.

### Takers Path:
1. Takers are not asked to fill in any data to use the application.
2. Takers can create an 'exchange point' to receive their needs (any point on the map).
3. Takers can attach any number of 'needs' to the exchange point.
4. Takers receive notification when the need is provided.
5. Takers can ask for organizers verification (to confirm their status).
6. Takers can report organizers abuse of the system (if any).

### Givers Path:
1. Givers are not asked to fill in any data to use the application.
2. Givers can see a map with taker's exchange points and the attached needs.
3. After providing a 'need', givers can notify takers.
4. Givers can contact organizers if they need a direct contact with takers. (like doctors).
5. Givers can report organizers abuse of the system (if any).

### Organizers Path:
With power comes responsibility, organizers are asked to vouch for takers and help givers reach real needs.
1. Organizers are asked to provide accurate details of themselves, and their account is activated manually by the admin after verifying their data and identity.
2. Organizers locations and data is always visible to both givers and takers.
3. Organizers receive verification requests from takers, and they are responsible for verifying or denying them.

# Usage

```bash
flutter pub get
flutter build apk
```


# UX
## first time:
### taker:
1. send print with role="T"
2. pick exchange point
    a. map on the country (lat, lng)
    b. name
    c. address
    d. brief
   

### organizers:
1. register form
    a. email
    b. password
    c. first_name
    d. last_name
    e. phone
    f. address
    g. map on the country (lat, lng)
   

## everytime:
send the print with role=null, possible scenarios:
1. get token with role, proceed based on role
2. get error, return to first time
3. get unverified, ask the organizer to wait for admin approval

### takers:
1. 3 tabs: map, needs and notifications
2. get exchange point, if none return to first time
3. open map centered on exchange point
4. get organizers between (min, max)
   a. clicking on any organizer will show organizer details, and allow sending verification request
   b. cannot send verification request before filling all user data fields
5. needs tab allows adding, removing and checking needs status

### organizers:
1. 3 tabs: map, vouch requests (requests) and notification
2. get location (from profile)
3. open map centered on location
4. get takers and organizers between (min, max)
   a. clicking on any organizer will show organizer details
   b. clicking on takers point allows sending message to taker (via notification, doesn't show any information about takers)
5. requests tab allows adding, removing and checking verification requests

### givers
1. 3 tabs: map, needs and notifications
2. center the map on last location, if none return to first time
3. get takers and organizers between (min, max)
   a. can filter takers based on need category
   b. clicking on taker point will show list of needs
4. needs tab allows checking and removing provided needs


# Related Projects:
* Backend: (on-going) https://github.com/saad4software/greenhands_backend
* Frontend: (on-going) https://github.com/saad4software/greenhands_frontend
* Mobile: (on-going) https://github.com/saad4software/greenhands_mobile

