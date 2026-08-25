 Why would different apps choose different OTP validity windows — some 1 minute, some 1 hour, and why might Rapido reuse the same OTP?


 How would you generate a 6-digit OTP? What properties does it need (think: randomness, collision, guessability)? Would you store the OTP itself in your database, or something else?


 Where would you store an OTP — a regular SQL table, or something else? How would you make it automatically "erase" or become invalid after N minutes without a manual cleanup job scanning the whole table?