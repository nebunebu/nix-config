{ config, ... }:
let
  nbxmls = "${config.xdg.configHome}/newsboat/xmls";
in
{
  imports = [
    ./full-yt/default.nix
  ];

  programs.newsboat = {
    urls = [
      {
        tags = [ "schlock" ];
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC-AQKm7HUNMmxjdS371MSwg";
        title = "Channel 5 with Andrew Callaghan";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC05XpvbHZUQOfA6xk4dlmcw";
        title = "DJ Ware";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC0qBGtdt2WwEmlMQnxWxCJw";
        title = "Friction";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC1FQyAL8cvaK0bR0RfM_fjA";
        title = "MetaMaths";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC2-7WZw9wU4fTqiOb_syGbg";
        title = "Traap";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC29ju8bIPH5as8OGnQzwJyA";
        title = "Traversy Media";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC2Xd-TjJByJyK2w1zNwY0zQ";
        title = "Beyond Fireship";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC2eYFnH61tmytImy1mTYvhA";
        title = "Luke Smith";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC3KV2kFy2YhjYvverIy2WnA";
        title = "Dialect";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC3lckDgoph04PBXP0gh3OOw";
        title = "Styrofoam Bonfire";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC3yaWWA9FF9OBog5U9ml68A";
        title = "SavvyNik";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC48RbTE89cvzD8hLgE4D6Lg";
        title = "Sean Mayfield";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC4a9LfdavRlVMaSSWFdIciA";
        title = "RobWords";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC5--wS0Ljbin1TjWQX6eafA";
        title = "bigboxSWE";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC51UPs8iqgC6ugVROBcUQEQ";
        title = "Matty McTech";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC56l7uZA209tlPTVOJiJ8Tw";
        title = "Low Byte Productions";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC59ZRYCHev_IqjUhremZ8Tg";
        title = "Harry Mack";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC5KDiSAFxrDWhmysBcNqtMA";
        title = "Eric Murphy";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC64TYItcUS940vNWhQRnJWg";
        title = "World of Antiquity";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC6biysICWOJ-C3P4Tyeggzg";
        title = "Low Level Learning";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC6hgjy7UyY0ElBp9sf9w62w";
        title = "David Boylan";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC6jM0RFkr4eSkzT5Gx0HOAw";
        title = "Michael Penn";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC6nSFpj9HTCZ5t-N3Rm3-HA";
        title = "Vsauce";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC7YOGHUfC1Tb6E4pudI9STA";
        title = "Mental Outlaw";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC82d7bBOUmsE_b8crhEgSIw";
        title = "Gifted Hater";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC8ENHE5xdFSwx71u3fDH5Xw";
        title = "ThePrimeagen";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC8butISFwT-Wl7EV0hUK0BQ";
        title = "freeCodeCamp.org";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC9KqASwIqkQ6IP6ofLqVIVw";
        title = "ziontee113";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC9rTsvTxJnx1DNrDA3Rqa6A";
        title = "Dr. Trefor Bazett";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC9x0AN7BWHpCDHSm9NiJFJQ";
        title = "NetworkChuck";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCBGOUQHNNtNGcGzVq5rIXjw";
        title = "Kunal Kushwaha";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCBKvlmuiSfSbH0KEVagdAjA";
        title = "Glutanimate";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCBa659QWEk1AI4Tg--mrJ2A";
        title = "Tom Scott";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCBq5p-xOla8xhnrbhu8AIAg";
        title = "Tech Over Tea";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCCPVkOco-yneXCaLguw_BmA";
        title = "Watch your Language";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCCcrR0XBH0aWbdffktUBEdw";
        title = "Mutual Information";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCDzVUXiTr3hClI-zzCWbYzg";
        title = "Spanning Tree";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCEBb1b_L6zDS3xTUrIALZOw";
        title = "MIT OpenCourseWare";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCEU9D6KIShdLeTRyH3IdSvw";
        title = "It's FOSS - Linux Portal";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCEWpbFLzoYGPfuWUMFPSaoA";
        title = "The Organic Chemistry Tutor";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCEak_TSGMnAlh0kdqixjxgw";
        title = "Coding Cleverly";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCEbYhDd6c6vngsF5PQpFVWg";
        title = "Tsoding";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCEqNbbsx0i7fhwRt0saYIcQ";
        title = "Ancient Americas";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCFaSR7gUU39qJe-eDSiGY0A";
        title = "Geography Geek";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCFh6FCMsTdnfEA_N7rdIBnw";
        title = "Chess Traps";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCFhXFikryT4aFcLkLw2LBLA";
        title = "NileRed";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCG6tBbWzY_ZR4_rd72vp6CA";
        title = "Alliterative";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCGVHC4L6gjS13AMe-JMOjHg";
        title = "Kane B";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCGX1QMBfoq-vYQTr8MUCDqA";
        title = "The Pharaoh Nerd";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCGYSfZbPp3BiAFs531PBY7g";
        title = "TrevTutor";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCHEnZhUKjZSLYs3jJ0raKZA";
        title = "Another Roof";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCHErB0TULAlldbhPMfBJ1Xg";
        title = "linuxhint";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCHP9CdeguNUI-_nBv_UXBhw";
        title = "Daniel Naroditsky";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCHnyfMqiRRG1u-2MsSQLbXA";
        title = "Veritasium";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCI539r_OxiqZpUUhmPXsrEA";
        title = "Exercism";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCIh4QOvH7v8eQNdUb2As9VA";
        title = "Jonathan Schrantz";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCJVnko6tQ56PYB5BNNChPGg";
        title = "ibx2cat";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCMiInY8BhSUtCarO6uu6i_g";
        title = "Mark McNally";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCMiyV_Ib77XLpzHPQH_q0qQ";
        title = "Veronica Explains";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCOuWeOkMrq84u5LY6apWQ8Q";
        title = "TREY the Explainer";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCPX4OLPrulGFE_c1FXZjwzg";
        title = "jHan";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCQYMhOMi_Cdj1CEAU-fv80A";
        title = "Neso Academy";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCQzOCKDVAYuUYQEawsMBO-g";
        title = "Attic Philosophy";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCS0N5baNlQWJCUrhCEo8WlA";
        title = "Ben Eater";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCS97tchJDq17Qms3cux8wcA";
        title = "chris@machine";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCSHZKyawb77ixDdsGog4iWA";
        title = "Lex Fridman";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCTUYHL3XgAYmVChdlK_vnVQ";
        title = "Comedy Enforcement";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCUMwY9iS8oMyWDYIe6_RmoA";
        title = "No Boilerplate";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCUdkjbeIFea0qUSgwR1CUOg";
        title = "Studying With Alex";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCUyeluBRhGPCW4rPe_UvBZQ";
        title = "ThePrimeTime";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCVls1GmFKf6WlTraIb_IaJg";
        title = "DistroTube";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCVwfqPkv08OTuHzkPU3EaDw";
        title = "languagejones";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCWI-ohtRu8eEeDj93hmUsUQ";
        title = "Coding with Lewis";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCXdOGwYxJJZxbGBk02z5vVw";
        title = "Marius Furter";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCXl0Zbk8_rvjyLwAR-Xh9pQ";
        title = "Insights into Mathematics";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCXy10-NEFGxQ3b4NVrzHw1Q";
        title = "Eric Rosen";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCZ4AMrDcNrfy3X6nsU8-rPg";
        title = "Economics Explained";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCZDA1kA3y3EIg25BpcHSpwQ";
        title = "Tinkernut";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCZTme3vf6kXmXfSsIr06lvQ";
        title = "Swegle Studios";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCZgt6AzoyjslHTC9dz0UoTw";
        title = "ByteByteGo";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC_hukbByJP7OZ3Xm2tszacQ";
        title = "Jeffrey Kaplan";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC_mYaQAE6-71rjSN6CeCA-g";
        title = "NeetCode";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UC_zBdZ0_H_jn41FDRG7q4Tw";
        title = "Vimjoyer";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCaSCt8s_4nfkRglWCvNSDrg";
        title = "CodeAesthetic";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCbWcXB0PoqOsAvAdfzWMf0w";
        title = "Fredrik Knudsen";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCbfYPyITQ-7l4upoX8nvctg";
        title = "Two Minute Papers";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCbwXnUipZsLfUckBPsC7Jog";
        title = "Online Tutorials";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCbyE5OvaP4GJhKvPCXxjWvw";
        title = "Fire of Learning";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCbz8dE4FPXQcEr1-F8FrMpw";
        title = "Dr. Bowers' Office Hours";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCcnAEyz9VnlBL1DiQqliJkQ";
        title = "Harry Mack Clips";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCd3dNckv1Za2coSaHGHl5aA";
        title = "TJ DeVries";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCdwo4k1RQHTcq_-WS7Cazqg";
        title = "The Bright Side of Mathematics";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCeGFPCKVL2gRHZSSor1TryQ";
        title = "Captchas";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCf93fPKwotph47H3_KDcRyg";
        title = "Kris Occhipinti";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCgBVkKoOAr3ajSdFFLp13_A";
        title = "KRAZAM";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UChDxbOUQRXEZ1zdI14Zyx9w";
        title = "Chess Vibes";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UChhMB_J0kz8eBJECy4d5uSQ";
        title = "Crecganford";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UChnRk6mxWsSOGElm8phdSxw";
        title = "Simon Roper";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCiQtkTO-jrzkNx6G6E7AMfw";
        title = "Duncan Clarke";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCjKCYQ21t4GMWWDQZI2jTYg";
        title = "s1n7ax";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCjP-MiAEn9DPvUHNyGEs7Wg";
        title = "hochelaga";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCjSEJkpGbcZhvo0lr-44X_w";
        title = "TechHut";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCkcnYVAVZQOB-nXHechtXDg";
        title = "Benjamin";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCld68syR8Wi-GY_n4CaoJGA";
        title = "Brodie Robertson";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCmBxAllEMwwmCyqvXNYuaXA";
        title = "The FrontRoom";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCn8OYopT9e8tng-CGEWzfmw";
        title = "Atrocity Guide";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCngn7SVujlvskHRvRKc1cTw";
        title = "BugsWriter";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCo71RUe6DX4w-Vd47rFLXPg";
        title = "typecraft";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCpvS3EykHW--l0ogUhMEjEw";
        title = "Colin Galen";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCq8JbYayUHvKvjimPV0TCqQ";
        title = "My CS";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCr4z98ss3YS6iQMBHS2jS8w";
        title = "Dialogic";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCrVWVOBoBu7W-aXbApDEuyQ";
        title = "Khalili Oriented Programming";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCsBjURrPoezykLs9EqgamOA";
        title = "Fireship";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCuPgdqQKpq4T4zeqmTelnFg";
        title = "kaptainkristian";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCvWRKmcplBTYQS49AVGsLgw";
        title = "Majesty of Reason";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCvjgXvBlbQiydffZU7m1_aw";
        title = "The Coding Train";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCwRXb5dUK4cvsHbx-rGzSgw";
        title = "Derek Banas";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCx3b18RQVMGx-1R7jM2ModA";
        title = "A Byte of Code";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCxQKHvKbmSzGMvUrVtJYnUA";
        title = "Learn Linux TV";
      }
      {
        url = "http://www.youtube.com/feeds/videos.xml?channel_id=UCzGoTD4RMsbUJCQcnWs0DRw";
        title = "Ben S Chess";
      }
      {
        tags = [ "neovim" "articles" ];
        title = "This Week in Neovim";
        url = "https://dotfyle.com/this-week-in-neovim/rss.xml ";
      }
      {
        tags = [ "articles" ];
        title = "lifehaker";
        url = "https://lifehacker.com/feed/rss";
      }
      {
        tags = [ "articles" ];
        title = "longreads";
        url = "https://longreads.com/feed/";
      }
      {
        tags = [ "articles" ];
        title = "aeon";
        url = "https://aeon.co/feed.rss";
      }
      {
        tags = [ "articles" ];
        title = "mental floss";
        url = "https://www.mentalfloss.com/rss.xml";
      }
      {
        tags = [ "articles" ];
        title = "openculture";
        url = "https://www.openculture.com/feed/rss2";
      }
      {
        tags = [ "yt" "nix" ];
        title = "IogaMaster";
        url = "https://www.scriptbarrel.com/xml.cgi?channel_id=UCFzUEe9XUlkDLp6AmtNzmOA";
      }
      {
        tags = [ "yt" "nix" ];
        title = "RubberDuck";
        url = "https://www.youtube.com/feeds/videos.xml?channel_id=UCs_xdqtQHTkl7LxazKIjKCg";
      }
    ];
  };
}
