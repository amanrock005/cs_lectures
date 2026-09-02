What core features would you include in v1 (as a fresher-level design, not  the full YouTube)?

Design high level architecture of YouTube 


What happens step by step from "user clicks play" to "video starts streaming" — where does the request  go first, and how does it find the video fast?


What happens if the video is not yet cached in the India CDN edge (cache miss) —  what's the fallback path? 


How does the client actually decide which resolution to request, and how does it switch mid-playback if network conditions change
 (e.g., user goes from WiFi to weak mobile data)?



how would you handle the "view count" update for this video without hammering your database on every single play?



For the core videos table (title, description, owner, duration, upload date, status, blob URLs per resolution) — would you use SQL or NoSQL? Justify with the actual reasoning (not just "it has relationships").



Comments on a video can be nested (replies to replies). How would you model comment data — SQL with a parent_comment_id foreign key, or a NoSQL document structure? What breaks at scale with each approach?



Subscriptions: "User A subscribes to Channel B." At YouTube's scale, some channels have 100M+ subscribers. If User A's homepage needs to show "latest videos from channels I'm subscribed to," how would you design this so it's fast — do you query subscriptions live, or precompute something? (This is the classic "fan-out on write vs fan-out on read" problem — have you heard of it?)



Search — a user types "cat videos" in the search bar. What kind of database/index would actually serve this, and why would a normal SQL LIKE '%cat%' query be a terrible idea at scale?



Design the rough schema (tables/collections + key fields) for YouTube, covering both SQL and NoSQL



A user can save videos to 'Watch Later' or create custom playlists. How would you model this in your database? Would you use SQL or NoSQL, and why?



What happens if a video in someone's playlist gets deleted by its owner? How does your schema handle that?


how video upload notification is pushed to subscribers?


A user has subscribed to multiple channels. what if all the channels post video at the same time. will this create a write amplication problem or the notification will self DoDS itself?


in case of livestreams all the users must be notified regardless of the subscriber count then how does youtube handle those notification and feed update?


explain how youtube servers works?



design a youtube like private application but where the number users are 10k
- can I use third party cloud services such as AWS etc yes
- cloud cost is a limit - No
- are those 10K user scattered are in the same regions
- do we need to store multiple resolution - Yes
- can all the 10k user upload videos or it is a subset of 10K user (some user will be more active than other users but everyone can upload video)
- is there a limit on number of videos each user can upload - 5 each day
- is there a max duration of vidos that out app can support - user cannot upload video longer than 15 minutes
- app should support like, share, subscribe, comment
- do we need to notifiy user on certain events like vido posted - Yes
- Is the raw upload kept in BLOB permanently, or deleted after transcoding? Worth a one-line decision (usually: keep raw for a while for re-transcode/audit, then lifecycle-delete to save cost).


where can youtube break?
- if user upload videos at higher rate(producer) than the rate at which transcoding takes place(consumer) so the message queue can fillup completely?
- transcoding process what if chunks do not get encoding properly ie what possible can go wrong in transcoding process
- what if the video upload fails midway


how does youtube handles live streaming?

does youtube keeps the original vider after transcoding has happened?


Next live stream 

what is vitess how does it work?

