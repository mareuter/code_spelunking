var user = prompt("You are walking along in the forest when you come upon a troll. Do you FIGHT him, PAY him or RUN from him?").toLowerCase();

switch (user) {
  case 'fight':
      var strong = prompt("Are you STRONG? YES or NO?").toLowerCase();
      var smart = prompt("Are you SMART? YES or NO?").toLowerCase();
      if (strong === 'yes' && smart === 'yes') {
          console.log("You fight the troll and win! Nice going!");
      }
      else {
          console.log("The troll gets the better of you. You're dead.");
      }
      break;
  case 'pay':
      var money = prompt("Do you have MONEY? YES or NO?").toLowerCase();
      if (money === 'yes') {
          console.log("The troll let's you pass, but tells you not to return this way.");
      }
      else {
          console.log("The troll takes you to work in his mine where you die in an accident.");
      }
      break;
  case 'run':
      var fast = prompt("Are you FAST? YES ot NO?").toLowerCase();
      var agile = prompt("Are you AGILE? YES or NO?").toLowerCase();
      if (fast === 'yes' || agile === 'yes') {
          console.log("You escape the troll, but just barely.");
      }
      else {
          console.log("The troll catches and eats you for lunch.");
      }
      break;
  default:
      console.log("You didn't supply a known answer. Do you really WANT to play?");
}