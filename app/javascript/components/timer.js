

function clickTimer(e) {
  const html = `<div class=exercise-timer>00:30</div>`;
  e.toElement.insertAdjacentHTML("afterend", html);
  e.toElement.remove();
  const workoutTime = 30;
  const numberOfExercises = document.querySelectorAll('.exercise-list-exercise-name').length;
  const start = new Date();
  const countDownDate = new Date(start.getTime() + workoutTime*60000);
// Timer countdown and function changing exercise every 30 seconds
  setInterval(function() {
    const currentExercise = document.querySelector('.current-exercise-name');
    let index = parseInt(currentExercise.dataset.index);
    if (index === numberOfExercises) { index = 0 };
    const nextExercise = document.querySelector(`div[data-index='${index+1}']`);
    currentExercise.innerText = nextExercise.innerText;
    currentExercise.dataset.index = index + 1;
  }, 30000)
  const x = setInterval(function() {

    // Get todays date and time
    const now = new Date().getTime();

    // Find the distance between now and the count down date
    const distance = countDownDate - now;

    // Time calculations for minutes and seconds
    const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
    const seconds = Math.floor((distance % (1000 * 60)) / 1000);

    // Display the result in the timer
    document.querySelector(".workout-timer").innerHTML = minutes + "m " + seconds + "s ";
    if (seconds > 30){
      document.querySelector(".exercise-timer").innerHTML = "00:" + (seconds-30);
    } else if (seconds < 10) {
      document.querySelector(".exercise-timer").innerHTML = "00:0" + seconds;
    } else {
      document.querySelector(".exercise-timer").innerHTML = "00:" + seconds;
    }  // If the count down is finished, write some text
    if (distance <= 0) {
      clearInterval(x);
      document.querySelector(".workout-timer").innerHTML = "EXPIRED";
      document.querySelector(".exercise-timer").remove();
      document.querySelector(".finish-workout").style.display = "block";
    }
  }, 1000);
};

function initTimer() {
  const startButton = document.querySelector(".timer-start-button");
  startButton.addEventListener("click", clickTimer);
};



export { initTimer };
