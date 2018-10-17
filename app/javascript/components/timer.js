

function clickTimer(e) {
  e.toElement.remove();
  const workoutTime = 30
  const start = new Date();
  const countDownDate = new Date(start.getTime() + workoutTime*60000);
// Timer countdown and function changing exercise every 30 seconds
  const x = setInterval(function() {

    // Get todays date and time
    const now = new Date().getTime();

    // Find the distance between now and the count down date
    const distance = countDownDate - now;

    // Time calculations for days, hours, minutes and seconds
    const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((distance % (1000 * 60)) / 1000);

    // Display the result in the element with id="demo"
    document.querySelector(".workout-timer").innerHTML = minutes + "m " + seconds + "s ";

    // If the count down is finished, write some text
    if (distance <= 0) {
      clearInterval(x);
      document.querySelector(".workout-timer").innerHTML = "EXPIRED";
    }
  }, 1000);
};

function initTimer() {
  const startButton = document.querySelector(".timer-start-button");
  startButton.addEventListener("click", clickTimer);
};



export { initTimer };
