fetch -H [
    x-api-key $env.HABITICA_API_KEY
    x-api-user $env.HABITICA_API_USER
    x-client $"($env.HABITICA_API_USER)-habitica.nu"
  ] https://habitica.com/api/v3/user
|get data.stats
|$"Level ($in.lvl) ($in.class)
💖 hp  : ($in.hp  | into int) / ($in.maxHealth)
📚 exp : ($in.exp | into int) / ($in.toNextLevel)
✨ mp  : ($in.mp  | into int) / ($in.maxMP)
"
|gh gist edit $env.GIST_ID -