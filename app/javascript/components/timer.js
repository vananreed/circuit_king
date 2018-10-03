function clickTimer(e) {
  e.toElement.remove();
  const timerMinutes = document.querySelector(".timer-workout-minutes");
  const timerSeconds = document.querySelector(".timer-workout-seconds");
// Timer countdown and function changing exercise every 30 seconds
};

function initTimer() {
  const startButton = document.querySelector(".timer-start-button");
  startButton.addEventListener("click", clickTimer);
};



export { initTimer };
