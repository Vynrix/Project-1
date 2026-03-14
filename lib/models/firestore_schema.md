# Firestore Schema for Nadodi V2

## Collections

### users
- uid: string (document ID)
- email: string
- displayName: string
- photoUrl: string
- favourites: List<place_id>
- bookmarks: List<spot_id>
- tripHistory: List<trip_id>

### saved_places
- user_id: string
- place_id: string
- timestamp: DateTime

### trip_plans
- user_id: string
- trip_id: string (document ID)
- itinerary: Map
- budget: number
- start_location: string
- duration: number
- travel_type: string
- created_at: DateTime
